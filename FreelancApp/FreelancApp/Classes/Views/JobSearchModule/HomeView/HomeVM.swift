//
//  HomeVM.swift
//  FreelancApp
//
//  Created by Rizvi on 9/6/21.
//

import UIKit
import RxSwift
import RxCocoa

class HomeVM {
    
    weak var coordinator: MainCoordinator?
    let jobService: JobService
    let disposeBag = DisposeBag()
    
    var jobCollectionArray = [JobCollectionViewModel]()
    let jobCollectionObj : BehaviorRelay<[JobCollectionViewModel]> = BehaviorRelay(value: [JobCollectionViewModel]())
    var currentDate: String = Utility.DateSection.getSimpleDate(Utility.DateSection.findPreviousDay())

    private let loadingProcess = BehaviorRelay(value: false)
    private let errorMessage = BehaviorRelay(value: "")
    
    var onShowLoading: Observable<Bool> {
        return loadingProcess
            .asObservable()
            .distinctUntilChanged()
    }
    var onShowError: Observable<String> {
        return errorMessage
            .asObservable()
            .distinctUntilChanged()
    }
    
    init(jobService: JobService = JobService()) {
        self.jobService = jobService
    }
    
    /*================================================================
    Description : Used to get get 3 future dates
    =================================================================*/
    func selectThreeDays() {
        for _ in 1...Constant.StaticValues.jobDays {
            let date = findCurrentDay()
            self.currentDate = Utility.DateSection.getSimpleDate(Utility.DateSection.findNextDate(date))
            self.getJobs(self.currentDate)
        }
    }
    
    /*================================================================
    Description : Used to this method to get formated date
    =================================================================*/
    func findCurrentDay() -> Date{
        return Utility.DateSection.dateFromString(currentDate, Constant.Strings.yearToDay) ?? Date()
    }
  
    /*================================================================
    Description : Used this method to get job list for 3 given days
    =================================================================*/
    func getJobs(_ nowDate: String) {
        let parameter: [String: Any] = [
            "date": nowDate
        ]
        loadingProcess.accept(true)
        jobService
            .getJobs(parameter)
            .subscribe(
                onNext: { [weak self] jobModel in
                    self?.loadingProcess.accept(false)
                    let jobArray = jobModel.map{return JobViewModel.init($0)}
                    self?.jobCollectionArray.append(JobCollectionViewModel.init(jobArray, nowDate))
                    self?.jobCollectionObj.accept(self!.jobCollectionArray)
                },
                onError: { [weak self] error in
                    self?.loadingProcess.accept(false)
                    self?.errorMessage.accept((error as! APIFailedReason).message!)
                }
            ).disposed(by: disposeBag)
    }
    
}

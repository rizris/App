//
//  HomeVMTests.swift
//  FreelancAppTests
//
//  Created by Rizvi on 9/8/21.
//

import XCTest
@testable import FreelancApp
import RxSwift
import RxCocoa

class HomeVMTests: XCTestCase {

    var homeVM: HomeVM!
    var jobService: JobService!
    let disposeBag = DisposeBag()
    
    override func setUp() {
        super.setUp()
        jobService = JobService()
    }
    
    override func tearDown() {
        homeVM = nil
        jobService = nil
        super.tearDown()
    }
    
    /*================================================================
    Description : Test get job service success
    =================================================================*/
    func testGetJobs_Success() {
        let exceptions = self.expectation(description: "Job list api parse exceptions")
        
        let parameter: [String: Any] = [
            "date": Utility.DateSection.getSimpleDate()
        ]
        jobService
            .getJobs(parameter)
            .subscribe(
                onNext: { [weak self] jobViewModel in
                    guard let _ = self else { return }
                    XCTAssertNotNil(jobViewModel)
                    exceptions.fulfill()
                },
                onError: { [weak self] error in
                    guard let _ = self else { return }
                    XCTAssertNotNil(error)
                    exceptions.fulfill()
                }
            )
            .disposed(by: disposeBag)
        self.waitForExpectations(timeout: 10.0, handler: nil)
    }
    
    /*================================================================
    Description : Test get job service Failed
    =================================================================*/
    func testGetJobs_Failed() {
        let exceptions = self.expectation(description: "Job list api parse exceptions")
        
        let parameter: [String: Any] = [
            "date": "2021-08-00"
        ]
        jobService
            .getJobs(parameter)
            .subscribe(
                onNext: { [weak self] jobViewModel in
                    guard let _ = self else { return }
                    XCTAssertNotNil(jobViewModel)
                    exceptions.fulfill()
                },
                onError: { [weak self] error in
                    guard let _ = self else { return }
                    XCTAssertNotNil(error)
                    exceptions.fulfill()
                }
            )
            .disposed(by: disposeBag)
        self.waitForExpectations(timeout: 10.0, handler: nil)
    }
    
    /*================================================================
    Description : Test get static job request succkes
    =================================================================*/
    func testMockJoblist_Success() {
        let service = MockServices()
        service.getJobResult = .success([JobModel.with()])
        homeVM = HomeVM(jobService: service)
        homeVM.getJobs("")
        
        let exceptions = self.expectation(description: "Job list mock api parse exceptions")
        
        homeVM.jobCollectionObj.asObservable()
            .subscribe(onNext: { jobViewModel in
        
                XCTAssertNotNil(jobViewModel)
                
                let jobViewModel = jobViewModel[0].items[0]
                
                XCTAssertEqual(jobViewModel.id, "1")
                XCTAssertEqual(jobViewModel.jobTitle, "Enthousiaste verkoper")
                XCTAssertEqual(jobViewModel.starts_at, "2021-09-06T11:00:00+02:00")
                XCTAssertEqual(jobViewModel.ends_at, "2021-09-06T18:00:00+02:00")
                                
                let expectedTimeResults = "14:30 - 21:30"
                XCTAssertEqual(jobViewModel.jobTime(), expectedTimeResults)
                
                let modelCurrency = Locale.currencyCode("EUR")
                let currencyCode = Locale.currencyCode((jobViewModel.currency)!)
                XCTAssertEqual(currencyCode, modelCurrency)
                
                let curCode = Locale.currencyCode((jobViewModel.currency)!)
                let expectedRate = "\(curCode)15.50"
                XCTAssertEqual(jobViewModel.jobHourlyrate(), expectedRate)
                
                exceptions.fulfill()
            }).disposed(by: disposeBag)
        
        self.wait(for: [exceptions], timeout: 10.0)
    }
    
    /*================================================================
    Description : Test get static job request Failed
    =================================================================*/
    func testMockJoblist_Failed() {
        let service = MockServices()
        service.getJobResult = .failure(.notFound)
        homeVM = HomeVM(jobService: service)
        homeVM.getJobs("")
        
        let exceptions = self.expectation(description: "Job list mock api parse exceptions")

        homeVM.onShowError.map{value in
            
            XCTAssertEqual(value, APIFailedReason.notFound.message)
            
            exceptions.fulfill()
        }.subscribe()
        .disposed(by: disposeBag)
        
        self.wait(for: [exceptions], timeout: 10.0)
    }
 
    
}

/*================================================================
Description : use this class and method to use mock service
=================================================================*/
private final class MockServices: JobService {
    var getJobResult: Result<[JobModel], APIFailedReason>? = nil
    
    override func getJobs(_ parameter: [String: Any] = [:]) -> Observable<[JobModel]> {
        return Observable.create { observer in
            switch self.getJobResult {
            case.success(let jobModel)?:
                observer.onNext(jobModel)
            case .failure(let error)?:
                observer.onError(error)
            case .none:
                observer.onError(APIFailedReason.notFound)
            }
        return Disposables.create()
        }
    }
}

/*================================================================
Description : Use this method to creade static model object 
=================================================================*/
extension JobModel {
    static func with() -> JobModel{
        let earnings = Earnings(amount: 15.5, currency: "EUR")
        let jobLinks = JobLinks(hero_380_image: "https://temper.works/photo/graaqy")
        let jobGeo = Coordinates(lat: 51.661583, lon: 5.032999)
        let jobAddress = Addresses(number: "77", street: "Hoofdstraat", city: "Kaatsheuvel", geo: jobGeo)
        
        let job = Jobs(id: "gzap6a", title: "Enthousiaste verkoper", extra_briefing: "Blokker is opzoek naar verkoopmedewerkers! Je bent enthousiast, hebt al winkelervaring of wilt graag ervaring opdoen in de detailhandel.", links: jobLinks, report_at_address: jobAddress)
        
        return JobModel(id: "1", status: "published", starts_at: "2021-09-06T11:00:00+02:00", ends_at: "2021-09-06T18:00:00+02:00", distance: "", earnings_per_hour: earnings, job: job)
    }
}

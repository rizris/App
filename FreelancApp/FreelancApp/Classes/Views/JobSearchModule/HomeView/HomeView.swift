//
//  HomeView.swift
//  FreelancApp
//
//  Created by Rizvi on 9/6/21.
//

import UIKit
import SwiftMessages
import RxSwift
import RxCocoa
import RxDataSources

class HomeView: BaseView {

    var homeVM = HomeVM()
    lazy var homeTable = UITableView.staticTable()
    lazy var buttonSignup = UIButton.buttonPrimary("Sing up")
    lazy var buttonLogin = UIButton.buttonSecondary("Log in")
    
    lazy var filterView = UIView.commonView(Constant.Colors.lightGray)
    lazy var lineView = UIView.commonView(Constant.Colors.darkText)
    lazy var buttonFilter = UIButton.buttonTitleImage("Filter", "filter")
    lazy var buttonKaart = UIButton.buttonTitleImage("Kaart", "map")
    
    var dataSource : RxTableViewSectionedReloadDataSource<JobCollectionViewModel>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSetup()
        initVM()
    }

    /*================================================================
    Description : Use this method for initial setup for this screen
    =================================================================*/
    private func initialSetup() {
        setupUIControls()
        updateUIChanges()
    }
    
    /*================================================================
    Description : Use this load job list for given 3 days
    =================================================================*/
    func initVM () {
        homeVM.selectThreeDays()
        loadAnimating()
        loadMessage()
        loadMoreData()
        setupTableCell()
        setupTableHeader()
        setupCellSelected()
        setupDataSource()
        buttonActions()
    }
    
    /*================================================================
    Description : Use this method to configure rx button actions
    =================================================================*/
    private func buttonActions() {
        buttonSignup.rx.tap.subscribe { [weak self] event in
            self?.homeVM.coordinator?.showSignupCoordinator()
        }.disposed(by: homeVM.disposeBag)
        
        buttonLogin.rx.tap.subscribe { [weak self] event in
            self?.homeVM.coordinator?.showLoginCoordinator()
        }.disposed(by: homeVM.disposeBag)
    }
    
    /*================================================================
    Description : Use this method to display loading view
    =================================================================*/
    private func loadAnimating(){
        homeVM
            .onShowLoading
            .map{ [weak self] in self?.loadAnimateView($0) }
            .subscribe()
            .disposed(by: homeVM.disposeBag)
    }
    /*================================================================
    Description : Use this method to alert user for any message
    =================================================================*/
    private func loadMessage() {
        homeVM
            .onShowError
            .map { [weak self] in self?.loadMessageView($0)}
            .subscribe()
            .disposed(by: homeVM.disposeBag)
    }
    
    /*================================================================
    Description : Use this method to load more data
    =================================================================*/
    private func loadMoreData(){
        homeTable.rx.willEndDragging.subscribe{[weak self] _ in
            guard let self = self else {return}
            if ((self.homeTable.contentOffset.y + self.homeTable.frame.size.height) >= self.homeTable.contentSize.height) {
                self.homeVM.selectThreeDays()
            }
        }.disposed(by: self.homeVM.disposeBag)
    }
}

extension HomeView {

    /*================================================================
    Description : Use this method to load required data
    =================================================================*/
    func setupDataSource () {
        if let dataSource = dataSource {
            homeVM.jobCollectionObj.asObservable()
                .bind(to: homeTable.rx.items(dataSource: dataSource))
                .disposed(by: homeVM.disposeBag)
        }
    }
    
    /*================================================================
    Description : Use this method to load table cells
    =================================================================*/
    func setupTableCell() {
        dataSource = RxTableViewSectionedReloadDataSource<JobCollectionViewModel>(
          configureCell: { dataSource, tableView, indexPath, jobViewModel in
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableCell.identifier, for: indexPath) as! HomeTableCell
            cell.jobViewModel = jobViewModel
            return cell
          })
    }
    
    /*================================================================
    Description : Use this method to load default header cell
    =================================================================*/
    func setupTableHeader() {
        dataSource?.titleForHeaderInSection = { dataSource, index in
            return dataSource.sectionModels[index].date
        }
    }
}

extension HomeView {
    /*================================================================
    Description : Use this method to display selected cell
    =================================================================*/
    func setupCellSelected () {
        homeTable
            .rx
            .modelSelected(JobViewModel.self)
            .subscribe(
                onNext: { [unowned self] jobViewModel in
                    let jobDetailView = JobDetailView()
                    jobDetailView.jobDetailVM.jobViewModel = jobViewModel
                    self.homeVM.coordinator?.showJobDetailCoordinator(jobViewModel)
        }).disposed(by: homeVM.disposeBag)
    }
}

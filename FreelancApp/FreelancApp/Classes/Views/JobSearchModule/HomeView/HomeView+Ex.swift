//
//  HomeView+Ex.swift
//  FreelancApp
//
//  Created by Rizvi on 9/6/21.
//

import UIKit
import SwiftHEXColors
import SnapKit
import SwiftMessages

extension HomeView {
    
    func setupUIControls () {
        title = Constant.App.APP_NAME
        self.removeObjects()
        
        view.addSubview(homeTable)
        view.addSubview(buttonSignup)
        view.addSubview(buttonLogin)
        view.addSubview(filterView)
        filterView.addSubview(lineView)
        filterView.addSubview(buttonFilter)
        filterView.addSubview(buttonKaart)
        
        self.setupUIConstraints()
    }
    
    /*================================================================
    Description : Use this method to apply constraints
    =================================================================*/
    private func setupUIConstraints () {
        self.homeTable.snp.makeConstraints{ (make) -> Void in
            make.top.left.right.bottom.equalTo(view).offset(0)
        }
        self.buttonSignup.snp.makeConstraints{ (make) -> Void in
            make.left.equalTo(view.snp.left).offset(20)
            make.height.equalTo(40)
            make.bottom.equalTo(view.snp.bottom).offset(-40)
        }
        self.buttonLogin.snp.makeConstraints{ (make) -> Void in
            make.left.equalTo(buttonSignup.snp.right).offset(20)
            make.right.equalTo(view.snp.right).offset(-20)
            make.height.width.equalTo(buttonSignup)
            make.bottom.equalTo(view.snp.bottom).offset(-40)
        }
        self.filterView.snp.makeConstraints{ (make) -> Void in
            make.centerX.equalTo(view)
            make.height.equalTo(50)
            make.bottom.equalTo(view.snp.bottom).offset(-200)
            make.width.equalTo(250)
        }
        self.lineView.snp.makeConstraints{ (make) -> Void in
            make.centerX.centerY.equalTo(filterView)
            make.width.equalTo(2)
            make.height.equalTo(40)
        }
        self.buttonFilter.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(filterView.snp.top).offset(5)
            make.bottom.equalTo(filterView.snp.bottom).offset(-5)
            make.left.equalTo(filterView.snp.left).offset(20)
        }
        self.buttonKaart.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(filterView.snp.top).offset(5)
            make.bottom.equalTo(filterView.snp.bottom).offset(-5)
            make.left.equalTo(buttonFilter.snp.right).offset(10)
            make.right.equalTo(filterView.snp.right).offset(-20)
            make.width.equalTo(buttonFilter)
        }
    }
    
    /*================================================================
    Description : Use this method to remove constraints for subviews
    =================================================================*/
    private func removeObjects(){
        homeTable.removeFromSuperview()
        buttonSignup.removeFromSuperview()
        buttonLogin.removeFromSuperview()
        filterView.removeFromSuperview()
    }
}

extension HomeView {
    
    /*================================================================
    Description : Use this method to updated changes for UI
    =================================================================*/
    func updateUIChanges() {
        homeTable.register(HomeTableCell.self, forCellReuseIdentifier: HomeTableCell.identifier)
        filterView.cornerRadius(radius: 20)
    }
    
    /*================================================================
    Description : Use this method to show activity loading
    =================================================================*/
    func loadAnimateView(_ isLoading: Bool){
        if isLoading {
            startAnimating()
        }else {
            stopAnimating()
        }
    }
    
    /*================================================================
    Description : Use this method to show any errors
    =================================================================*/
    func loadMessageView(_ message: String){
        Messages.AllertMessages.messageOnTop(message, Theme.error)
    }
    
}


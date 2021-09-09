//
//  HomeTableCell+Ex.swift
//  FreelancApp
//
//  Created by Rizvi on 9/4/21.
//

import UIKit
import SwiftHEXColors
import SnapKit

extension HomeTableCell {

    func setupUIControls () {
        self.removeObjects()
        
        contentView.addSubview(mainView)
        mainView.addSubview(jobImage)
        mainView.addSubview(jobDistance)
        mainView.addSubview(jobTitle)
        mainView.addSubview(jobHourlyrate)
        mainView.addSubview(jobTime)
        self.setupUIConstraints()
    }
    
    /*================================================================
    Description : Use this to setup constraints
    =================================================================*/
    private func setupUIConstraints () {
        self.mainView.snp.makeConstraints{ (make) -> Void in
            make.top.left.right.bottom.equalTo(contentView).offset(0)
        }
        self.jobImage.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(mainView).offset(0)
            make.left.equalTo(mainView.snp.left).offset(20)
            make.right.equalTo(mainView.snp.right).offset(-20)
            make.height.equalTo(200)
        }
        self.jobHourlyrate.snp.makeConstraints{ (make) -> Void in
            make.right.bottom.equalTo(jobImage).offset(0)
            make.height.equalTo(35)
            make.width.equalTo(80)
        }
        self.jobDistance.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(jobImage.snp.bottom).offset(10)
            make.left.right.equalTo(jobImage)
            make.height.equalTo(30)
        }
        self.jobTitle.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(jobDistance.snp.bottom).offset(1)
            make.left.right.equalTo(jobImage)
            make.height.equalTo(jobDistance)
        }
        self.jobTime.snp.makeConstraints{ (make) -> Void in
            make.top.equalTo(jobTitle.snp.bottom).offset(1)
            make.left.right.equalTo(jobImage)
            make.height.equalTo(jobDistance)
            make.bottom.equalTo(mainView.snp.bottom).offset(-20)
        }
    }
    
    /*================================================================
    Description : Use this method to remove subviews
    =================================================================*/
    private func removeObjects(){
        mainView.removeFromSuperview()
    }
    
}

extension HomeTableCell {
    /*================================================================
    Description : Use this method to updated neccesary changes for UI
    =================================================================*/
    func updateUIChanges() {
        jobHourlyrate.makeRightAllignment()
        jobImage.cornerRadius(7)
        jobHourlyrate.numberOfLines(0)
        
        jobHourlyrate.backgroundColor = UIColor(named: Constant.Colors.background)
        jobHourlyrate.roundedCorner([.layerMinXMinYCorner], radius: 20)
    }
    
}




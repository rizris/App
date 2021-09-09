//
//  HomeTableCell.swift
//  FreelancApp
//
//  Created by Rizvi on 9/6/21.
//

import UIKit

class HomeTableCell: BaseTableCell{

    static let identifier = "tableCell"
    
    lazy var mainView = UIView.commonView()
    lazy var jobImage = UIImageView.commonImage()
    lazy var jobTitle = UILabel.mainBoldTitle()
    lazy var jobDistance = UILabel.mainBoldTitle("", 16, Constant.Colors.textPurple)
    lazy var jobHourlyrate = UILabel.mainBoldTitle()
    lazy var jobTime = UILabel.normalText()
    
    /*================================================================
    Description : It will fetch once the data is available
    =================================================================*/
    var jobViewModel: JobViewModel? {
        didSet {
            bindJobViewModel()
        }
    }
  
    /* ==================================================
     Need to override this method to load UI setup
     ================================================== */
    override func setupCellViews() {
        setupUIControls()
        updateUIChanges()
    }

    /* ==================================================
     Description - Use this method to update ui
     ================================================== */
    private func bindJobViewModel(){
        if let jobViewModel = jobViewModel {
            jobViewModel.setupJobImage(imageView: jobImage)
            jobDistance.text = jobViewModel.jobDistance()
            jobTitle.text = jobViewModel.jobTitle
            jobHourlyrate.text = jobViewModel.jobHourlyrate()
            jobTime.text = jobViewModel.jobTime()
        }
    }
}



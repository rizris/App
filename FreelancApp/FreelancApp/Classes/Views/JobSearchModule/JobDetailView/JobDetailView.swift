//
//  JobDetailView.swift
//  FreelancApp
//
//  Created by Rizvi on 9/7/21.
//

import UIKit
import MapKit
import SwiftMessages

class JobDetailView: BaseView {
    
    var jobDetailVM = JobDetailVM()

    lazy var mapView = MKMapView.mapView()
    lazy var jobTitle = UILabel.mainBoldTitle()
    lazy var jobHourlyRate = UILabel.mainBoldTitle("", 16, Constant.Colors.textPurple)
    lazy var jobTime = UILabel.normalText()
    lazy var jobDistance = UILabel.mainBoldTitle("", 16, Constant.Colors.textPurple)
    lazy var jobDescription = UILabel.normalText()
        
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let _ = jobDetailVM.jobViewModel else {
            Messages.AllertMessages.messageOnTop(Constant.Message.try_again, Theme.error)
            return
        }
        
        setupUIControls()
        updateUIChanges()
        updateJobDetails()
    }
    
    /*================================================================
    Description : Use this method to show required data
    =================================================================*/
    func updateJobDetails() {
        if let jobViewModel = jobDetailVM.jobViewModel {
            jobTime.text = jobViewModel.jobTime()
            jobTitle.text = jobViewModel.jobTitle
            jobHourlyRate.text = jobViewModel.jobHourlyrate()
            jobDistance.text = jobViewModel.jobDistance()
            jobDescription.text = jobViewModel.jobDescription
            
            let jobLocation = CLLocation(latitude: jobViewModel.lat ?? 00, longitude: jobViewModel.lon ?? 00)
            
            setupCameraPosition(jobLocation)
            centerToLocation(jobLocation)
            setupAnnotation()
        }
    }
    
    


}


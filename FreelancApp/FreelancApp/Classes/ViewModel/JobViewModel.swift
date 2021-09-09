//
//  JobViewModel.swift
//  FreelancApp
//
//  Created by Rizvi on 9/6/21.
//

import Foundation
import AlamofireImage
import UIKit
import CoreLocation

struct JobViewModel {
    let jobModel: JobModel
    
    init(_ jobModel: JobModel) {
        self.jobModel = jobModel
    }
    
    var id: String? {
        return jobModel.id
    }
    var status: String? {
        return jobModel.status
    }
    var starts_at: String? {
        return jobModel.starts_at
    }
    var ends_at: String? {
        return jobModel.ends_at
    }
    var distance: String? {
        return jobModel.distance
    }
    var amount: Double? {
        return jobModel.earnings_per_hour.amount
    }
    var currency: String? {
        return jobModel.earnings_per_hour.currency
    }
    var jobId: String? {
        return jobModel.job.id
    }
    var jobTitle: String? {
        return jobModel.job.title
    }
    var jobDescription: String? {
        return jobModel.job.extra_briefing
    }
    var jobImage: String?{
        return jobModel.job.links.hero_380_image
    }
    var number: String? {
        return jobModel.job.report_at_address.number
    }
    var street: String? {
        return jobModel.job.report_at_address.street
    }
    var city: String? {
        return jobModel.job.report_at_address.city
    }
    var lat: Double? {
        return jobModel.job.report_at_address.geo.lat
    }
    var lon: Double? {
        return jobModel.job.report_at_address.geo.lon
    }
}

extension JobViewModel {
    /*================================================================
    Description : Use this method download image
    =================================================================*/
    func setupJobImage (imageView: UIImageView) {
        if let imageurl = URL(string: jobImage ?? "") {
            let filter = AspectScaledToFillSizeFilter(size: CGSize(width: 450, height: 250))
            imageView.contentMode = .scaleAspectFill
            imageView.af.setImage(withURL: imageurl, placeholderImage: UIImage.init(named: "placeholder"), filter: filter, completion: { response in
                imageView.contentMode = .scaleAspectFill
            })
        }else{
            imageView.image = UIImage.init(named: "placeholder")
            imageView.contentMode = .scaleAspectFill
        }
    }
    
    /*================================================================
    Description : Use this method to return distance from your location
    Eg. Now using default location
    =================================================================*/
    func jobDistance() -> String {
        let distance = String(format:"%.2f", getDistance())
        return "SERVING \(distance) km"
    }
    
    /*================================================================
    Description : Use this method to return hourly rate with Currency sign
    =================================================================*/
    func jobHourlyrate() ->String {
        if let sortCode = currency {
            let currencyCode = Locale.currencyCode(sortCode)
            return "\(currencyCode)\(String(format:"%.2f", amount ?? 00))"
        }
        return ""
    }
    
    /*================================================================
    Description : Use this method to return job start and end time
    =================================================================*/
    func jobTime() -> String{
        return "\(startTime()) - \(endTime())"
    }
    
    /*================================================================
    Description : Use this method to return start time
    =================================================================*/
    func startTime () -> String {
        if let time = starts_at {
            return Utility.DateSection.getTime(time)
        }
        return ""
    }
    
    /*================================================================
    Description : Use this method to return end time
    =================================================================*/
    func endTime () -> String {
        if let time = ends_at {
            return Utility.DateSection.getTime(time)
        }
        return ""
    }
    
    /*================================================================
    Description : Use this method to find the distance from the current locaton
    =================================================================*/
    func getDistance() -> Double {
        let sourceCoordinate = CLLocation(latitude: Constant.StaticValues.sourceLat, longitude: Constant.StaticValues.sourceLon)
        let destinationCoordinate = CLLocation(latitude: lat ?? 00, longitude: lon ?? 00)
        let distanceInMeters = sourceCoordinate.distance(from: destinationCoordinate) / 1000
        return distanceInMeters
    }
   
    
}

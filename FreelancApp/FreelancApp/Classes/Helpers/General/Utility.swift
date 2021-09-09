//
//  Utility.swift
//  FreelancApp
//
//  Created by Rizvi on 9/4/21.
//

import UIKit

class Utility {
    
    /* ==================================================
        App Amination setup here
     ====================================================*/
    class Animating {
        let activityView = IndicatorView()
        
        func startAnimating(_ view: UIView){
            view.addSubview(activityView)
            activityView.frame.size = UIScreen.main.bounds.size
            activityView.startAnimating()
        }
        
        func stopAnimating(){
            activityView.stopAnimating()
            activityView.removeFromSuperview()
        }
        
        func isAnimating() -> Bool{
            return activityView.isAnimating()
        }
    }
    
    /* ==================================================
        App date format here
     ====================================================*/
    class DateSection {
        class func getSimpleDate(_ date: Date = Date(), _ dateFormat: String = Constant.Strings.yearToDay) -> String {
            let dateFormatter : DateFormatter = DateFormatter()
            dateFormatter.dateFormat = dateFormat
            let dateString = dateFormatter.string(from: date)
            return dateString
        }
        class func findNextDate(_ date: Date, _ day: Int = 1) -> Date{
            let calendar = Calendar.current
            let mydate = calendar.date(byAdding: DateComponents(day: day), to: date)!
            return mydate
        }
        class func findPreviousDay(_ date: Date = Date(), _ day: Int = 1) -> Date{
            let calendar = Calendar.current
            let mydate = calendar.date(byAdding: DateComponents(day: -day), to: date)!
            return mydate
        }
        
        class func dateFromString (_ stringDate: String, _ dateFormat: String = Constant.Strings.dateFullFormat) -> Date? {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = dateFormat
            return dateFormatter.date(from: stringDate)
        }
        
        class func getDate(_ dateTime: String, _ dateFormat: String = Constant.Strings.yearToDay) -> String {
            if let date = dateFromString(dateTime) {
                let dateFormatter : DateFormatter = DateFormatter()
                dateFormatter.dateFormat = dateFormat
                let dateString = dateFormatter.string(from: date)
                return dateString
            }
            return ""
        }
        
        class func getTime(_ dateTime: String) -> String {
            if let date = dateFromString(dateTime) {
                let dateFormatter : DateFormatter = DateFormatter()
                dateFormatter.dateFormat = "HH:mm"
                let dateString = dateFormatter.string(from: date)
                return dateString
            }
            return ""
        }
    }
}

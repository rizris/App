//
//  Constant.swift
//  FreelancApp
//
//  Created by Rizvi on 9/4/21.
//

import UIKit

struct Constant {
    
    /* ==================================================
        Main app settings here
     ====================================================*/
    struct App {
        static let APP_NAME                     = "FreelancApp"
        static let BASE_URL                     = "https://temper.works/api/v3/"
    }
    
    /* ==================================================
        App Static values here
     ====================================================*/
    struct StaticValues {
        static let sourceLat                    = 52.337037
        static let sourceLon                    = 4.897743
        static let jobDays                      = 3
    }
    
    /* ==================================================
        App related strings here
     ====================================================*/
    struct Strings {
        static let font_name                    = "Helvetica Neue"
        static let font_name_bold               = "HelveticaNeue-Bold"
        static let yearToDay                    = "yyyy-MM-dd"
        static let dateFullFormat               = "yyyy-MM-dd'T'HH:mm:ssZ"
    }
    
    /* ==================================================
        App static messages herre
     ====================================================*/
    struct Message {
        static let try_again                    = "Please try again"
        static let NO_JOB_FOUND                 = "No Job infomation found"
        static let no_internet                  = "No internet connectivity"
    }
    
    /* ==================================================
        Ligh and Dark mood supported colors here
     ====================================================*/
    struct Colors {
        static let clear                        = UIColor.clear
        static let textPurple                   = "textPurple"
        static let textWhite                    = "textWhite"
        static let primary                      = "primary"
        static let primaryCommon                = "primanyCommon"
        static let background                   = "background"
        static let textPrimary                  = "textPrimary"
        static let darkText                     = "darkText"
        static let lightGray                    = "lightGray"
        
    }
    
    /* ==================================================
        Ligh and Dark mood supported images here
     ====================================================*/
    struct Image {
       
    }
    

}

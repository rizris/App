//
//  APIFailedReason.swift
//  FreelancApp
//
//  Created by Rizvi on 9/8/21.
//

import Foundation

/*================================================================
Description : Use this section for any notification message in api request
=================================================================*/
enum APIFailedReason: Int, Error {
    case noInternet = 1
    case notFound = 2
    
    var message: String? {
        switch self {
        case .noInternet:
            return Constant.Message.no_internet
        case .notFound:
            return Constant.Message.try_again
        }
    }
}

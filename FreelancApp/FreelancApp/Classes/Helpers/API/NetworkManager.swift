//
//  NetworkManager.swift
//  FreelancApp
//
//  Created by Rizvi on 9/4/21.
//

import UIKit
import Alamofire

class NetworkManager {
    /*================================================================
    Description : Used to check internet connectivity
    =================================================================*/
    static var isInternetAvailable:Bool {
        return NetworkReachabilityManager()!.isReachable
    }
    
    /*================================================================
    Description : Used to get direct APIs request
    =================================================================*/
    class func baseRequest(_ dataRequest: URLRequest?, withCallback completion: @escaping (Bool, String, Data?) -> Void) {
        if !self.isInternetAvailable {
            completion(false, Constant.Message.no_internet, nil)
            return
        }
        guard let urlRequest = dataRequest else {
            completion(false, Constant.Message.try_again, nil)
            return
        }
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error ) in
            guard error == nil, let data = data else {
                completion(false, Constant.Message.try_again, nil)
                return
            }
            completion(true, "", data)
        }.resume()
    }
}

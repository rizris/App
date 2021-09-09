//
//  JobService.swift
//  FreelancApp
//
//  Created by Rizvi on 9/4/21.
//

import Foundation

import RxSwift
import RxCocoa

class JobService {
    
    /*================================================================
    Description : Used to get job list from given days
    =================================================================*/
    func getJobs(_ parameter: [String: Any] = [:]) -> Observable<[JobModel]> {
        return Observable.create { observer -> Disposable in
            
            let urlString = "\(Constant.App.BASE_URL)shifts?filter[date]=\(parameter["date"] as! String)"
            let url = URL(string: urlString)
        
            var request = URLRequest(url: url!)
            request.httpMethod = "GET"
            request.setValue("application/json", forHTTPHeaderField: "accept")
            
            NetworkManager.baseRequest(request) { (success, message, data) in
                if success {
                    guard let data = data else {
                        observer.onError(APIFailedReason.notFound)
                        return
                    }
                    do {
                        let newValue = try JSONDecoder().decode(JobModelData.self, from: data)
                        if newValue.data.count > 0 {
                            observer.onNext(newValue.data)
                        }else{
                            observer.onError(APIFailedReason.notFound)
                        }
                    } catch {
                        observer.onError(APIFailedReason.notFound)
                    }
                }else{
                    observer.onError(APIFailedReason.notFound)
                }
            }
            return Disposables.create()
        }
    }
}



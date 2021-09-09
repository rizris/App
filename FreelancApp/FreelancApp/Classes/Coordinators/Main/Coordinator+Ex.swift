//
//  Coordinator+Ex.swift
//  FreelancApp
//
//  Created by Rizvi on 9/6/21.
//

import Foundation

extension Coordinator {
    /*----------------==========--------------------//
     Remove child coordinator
     ----------------==========--------------------*/
    func childDidFinish (_ child: Coordinator?)  {
        for(index, coodinator) in childCoordinators.enumerated() {
            if coodinator === child {
                childCoordinators.remove(at: index)
                print(childCoordinators)
                print("Child removed")
                break
            }
        }
    }
    
}

//
//  Coordinator.swift
//  FreelancApp
//
//  Created by Rizvi on 9/6/21.
//

import UIKit

protocol Coordinator: AnyObject {
    
    var childCoordinators: [Coordinator] {get set}
    var navController: UINavigationController{ get set}
    
    func start ()
    
}

//
//  MainCoordinator.swift
//  FreelancApp
//
//  Created by Rizvi on 9/6/21.
//

import UIKit

class MainCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
    
    var childCoordinators = [Coordinator]()
    
    var navController: UINavigationController
    
    init(_ navcontroller: UINavigationController) {
        self.navController = navcontroller
    }
    
    func start() {
        navController.delegate = self
        let homeVM = HomeVM()
        let homeView = HomeView()
        homeView.homeVM = homeVM
        homeView.homeVM.coordinator = self
        navController.pushViewController(homeView, animated: false)
    }
    
    func showSignupCoordinator () {
        let child = SignupCoordinator(navController) 
        self.childCoordinators.append(child)
        child.start()
    }
    
    func showLoginCoordinator () {
        let child = LoginCoordinator(navController)
        self.childCoordinators.append(child)
        child.start()
    }
    
    func showJobDetailCoordinator (_ jobViewModel: JobViewModel) {
        let child = JobDetailCoordinator(navController)
        self.childCoordinators.append(child)
        child.jobViewModel = jobViewModel
        child.start()
    }
    
}

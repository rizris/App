//
//  SignupCoordinator.swift
//  FreelancApp
//
//  Created by Rizvi on 9/6/21.
//

import UIKit


class SignupCoordinator : NSObject, Coordinator {
    var childCoordinators = [Coordinator]()
    
    var navController: UINavigationController
    
    init(_ navcontroller: UINavigationController) {
        self.navController = navcontroller
    }
    
    func start() {
        let signupVM = SignupVM()
        let signupView = SignupView()
        signupView.title = "Sign up"
        signupView.signupVM = signupVM
        signupView.signupVM.coordinator = self
        navController.pushViewController(signupView, animated: false)
    }
    
    
}

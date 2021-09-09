//
//  LoginCoordinator.swift
//  FreelancApp
//
//  Created by Rizvi on 9/6/21.
//

import UIKit

class LoginCoordinator : NSObject, Coordinator {
    var childCoordinators = [Coordinator]()
    
    var navController: UINavigationController
    
    init(_ navcontroller: UINavigationController) {
        self.navController = navcontroller
    }
    
    func start() {
        let loginVM = LoginVM()
        let loginView = LoginView()
        loginView.title = "Log In"
        loginView.loginVM = loginVM
        loginView.loginVM.coordinator = self
        navController.pushViewController(loginView, animated: false)
    }
    
    
}

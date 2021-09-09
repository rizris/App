//
//  MainCoordinator+Ex.swift
//  FreelancApp
//
//  Created by Rizvi on 9/6/21.
//

import UIKit

extension MainCoordinator{
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        navigationController.setNeedsStatusBarAppearanceUpdate()
        navigationController.navigationBar.barTintColor = UIColor(named: Constant.Colors.primaryCommon)
        navigationController.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor(named:Constant.Colors.textWhite) as Any]
        navigationController.navigationBar.tintColor = UIColor(named:Constant.Colors.textWhite)
        navigationController.navigationBar.isTranslucent = false
        
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        //check viewcontroller when moving from HomeView
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }
        //check viewcontroller array already contains the view controller then it pushing view controller
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }
        if let loginView = fromViewController as? LoginView {
            childDidFinish(loginView.loginVM.coordinator)
        }
        if let signupView = fromViewController as? SignupView {
            childDidFinish(signupView.signupVM.coordinator)
        }
        if let jobDetailView = fromViewController as? JobDetailView {
            childDidFinish(jobDetailView.jobDetailVM.coordinator)
        }
    }
    
}

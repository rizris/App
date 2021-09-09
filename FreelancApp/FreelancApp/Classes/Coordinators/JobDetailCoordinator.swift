//
//  JobDetailCoordinator.swift
//  FreelancApp
//
//  Created by Rizvi on 9/6/21.
//

import UIKit

class JobDetailCoordinator : NSObject, Coordinator {
    var childCoordinators = [Coordinator]()
    
    var navController: UINavigationController
    var jobViewModel: JobViewModel?
    
    init(_ navcontroller: UINavigationController) {
        self.navController = navcontroller
    }
    
    func start() {
        let jobDetailVM = JobDetailVM()
        let jobDetailView = JobDetailView()
        jobDetailView.title = "Job Details"
        jobDetailView.jobDetailVM = jobDetailVM
        jobDetailView.jobDetailVM.coordinator = self
        jobDetailView.jobDetailVM.jobViewModel = jobViewModel
        self.navController.pushViewController(jobDetailView, animated: false)
    }
    
    
}

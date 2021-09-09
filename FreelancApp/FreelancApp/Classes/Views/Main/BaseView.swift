//
//  BaseView.swift
//  FreelancApp
//
//  Created by Rizvi on 9/6/21.
//

import UIKit

class BaseView: UIViewController {

    lazy var utilityAnimating = Utility.Animating()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(named: Constant.Colors.background)
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    /* ==================================================
        Start animating
     ====================================================*/
    func startAnimating () {
        if !utilityAnimating.isAnimating(){
            DispatchQueue.main.async {
                self.utilityAnimating.startAnimating(self.view)
            }
        }
    }
    
    /* ==================================================
        Stop animating
     ====================================================*/
    func stopAnimating () {
        DispatchQueue.main.async {
            self.utilityAnimating.stopAnimating()
        }
    }

}

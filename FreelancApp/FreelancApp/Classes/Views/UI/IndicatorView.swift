//
//  IndicatorView.swift
//  FreelancApp
//
//  Created by Rizvi on 9/6/21.
//

import UIKit
import NVActivityIndicatorView


class IndicatorView: UIView {

    var indicatorView : NVActivityIndicatorView?
    lazy var shadowView = UIView.commonView(Constant.Colors.darkText)
    
    private let presentingIndicatorTypes = {
        return NVActivityIndicatorType.allCases.filter { $0 != .blank }
    }()

    /*================================================================
    Description : Use this method to start animating
    =================================================================*/
    func startAnimating () {
        shadowView.alpha = 0.2
        self.backgroundColor = .clear
        shadowView.frame = self.frame
        let loaderFrame = CGRect(x: 0, y: 0, width: 60, height: 60)
        indicatorView = NVActivityIndicatorView(frame: loaderFrame, type: presentingIndicatorTypes[20])
        indicatorView?.center = self.center
        indicatorView?.color = UIColor(named: Constant.Colors.primary) ?? .blue
        self.addSubview(shadowView)
        self.addSubview(indicatorView!)
        indicatorView?.startAnimating()
    }
    
    /*================================================================
    Description : Use this method to stop animating
    =================================================================*/
    func stopAnimating () {
        indicatorView?.stopAnimating()
    }
    
    /*================================================================
    Description : Use this method to check status
    =================================================================*/
    func isAnimating () -> Bool {
        return indicatorView?.isAnimating ?? false
    }

}

//
//  View.swift
//  FreelancApp
//
//  Created by Rizvi on 9/6/21.
//

import UIKit

extension UIView {
    
    /*================================================================
    Description : Use this method display subview with backgroudn color
    =================================================================*/
    static func commonView(_ backColorString: String = Constant.Colors.background, _ radius: CGFloat = 0) -> UIView {
        let view = UIView()
        view.backgroundColor = UIColor(named: backColorString)
        view.layer.cornerRadius = radius
        return view
    }
    
    /*================================================================
    Description : Use this method to display subview with no background
    =================================================================*/
    static func simpleView() -> UIView {
        let view = UIView()
        view.backgroundColor = .clear
        view.clipsToBounds = true
        return view
    }

    
}

extension UIView {
    /*================================================================
    Description : Use this method to adjust single or multiple corne radius
    =================================================================*/
    func roundCorners(_ corners: CACornerMask, radius: CGFloat) {
        self.clipsToBounds = false
        self.layer.cornerRadius = radius
        self.layer.maskedCorners = corners
    }
    
    /*================================================================
    Description : Use this method entire corner radius
    =================================================================*/
    func cornerRadius(radius: CGFloat) {
        self.clipsToBounds = false
        self.layer.cornerRadius = radius
    }
}

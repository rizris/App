//
//  Label.swift
//  FreelancApp
//
//  Created by Rizvi on 9/6/21.
//

import UIKit

extension UILabel {
    
    /*================================================================
    Description : Use this method to load label with bold
    =================================================================*/
    static func mainBoldTitle(_ title: String = "", _ size: CGFloat = 18, _ color: String = Constant.Colors.textPrimary) -> UILabel {
        let label = UILabel()
        label.text = title
        label.textAlignment = .left
        label.textColor = UIColor(named: color)
        label.font = UIFont(name: Constant.Strings.font_name_bold, size: size)
        label.backgroundColor = Constant.Colors.clear
        return label
    }
    
    /*================================================================
    Description : Use this method to load label in normal font
    =================================================================*/
    static func normalText(_ title: String = "", _ size: CGFloat = 16, _ color: String = Constant.Colors.textPrimary) -> UILabel {
        let label = UILabel()
        label.text = title
        label.textAlignment = .left
        label.textColor = UIColor(named: color)
        label.font = UIFont(name: Constant.Strings.font_name, size: size)
        label.backgroundColor = Constant.Colors.clear
        return label
    }
    
}

/*================================================================
Description : Use this method to make additiona ui level changes in Label
=================================================================*/
extension UILabel {
    
    func makeRightAllignment () {
        self.textAlignment = .right
    }
    
    func roundedCorner(_ corners: CACornerMask, radius: CGFloat) {
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
        self.layer.maskedCorners = corners
    }
    
    func numberOfLines(_ line: Int) {
        self.numberOfLines = line
    }
}



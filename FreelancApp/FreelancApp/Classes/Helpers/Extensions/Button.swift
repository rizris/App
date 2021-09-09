//
//  Button.swift
//  FreelancApp
//
//  Created by Rizvi on 9/6/21.
//

import UIKit

extension UIButton {
    
    /*================================================================
    Description : Use this method to assign primary button
    =================================================================*/
    static func buttonPrimary(_ title: String, _ background: String = Constant.Colors.primary, _ text: String = Constant.Colors.textWhite) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.backgroundColor = UIColor(named: background)
        button.setTitleColor(UIColor(named: text), for: .normal)
        button.titleLabel?.font = UIFont(name: Constant.Strings.font_name_bold, size: 17)
        button.layer.cornerRadius = 5
        return button
    }
    
    /*================================================================
    Description : Use this method to assign secondary button
    =================================================================*/
    static func buttonSecondary(_ title: String, _ background: String = Constant.Colors.primary, _ text: String = Constant.Colors.textPrimary) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.backgroundColor = Constant.Colors.clear
        button.setTitleColor(UIColor(named: text), for: .normal)
        button.titleLabel?.font = UIFont(name: Constant.Strings.font_name_bold, size: 17)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(named: Constant.Colors.primary)?.cgColor
        return button
    }
    
    /*================================================================
    Description : Use this method to assing image and text to the button
    =================================================================*/
    static func buttonTitleImage(_ title: String, _ nameImg: String) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setImage(UIImage(named: nameImg), for: .normal)
        button.backgroundColor = Constant.Colors.clear
        button.setTitleColor(UIColor(named: Constant.Colors.darkText), for: .normal)
        button.titleLabel?.font = UIFont(name: Constant.Strings.font_name, size: 16)
        button.layer.cornerRadius = 5
        return button
    }
}

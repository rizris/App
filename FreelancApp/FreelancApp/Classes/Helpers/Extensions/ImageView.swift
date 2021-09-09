//
//  ImageView.swift
//  FreelancApp
//
//  Created by Rizvi on 9/6/21.
//

import UIKit

extension UIImageView {
    
    /*================================================================
    Description : Use this method display image
    =================================================================*/
    static func commonImage(_ name: String = "") -> UIImageView {
        let imgView = UIImageView()
        imgView.image = UIImage(named: name)
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        return imgView
    }
}

extension UIImageView {
    /*================================================================
    Description : Use this method to maintain corner radius
    =================================================================*/
    func cornerRadius(_ radius: CGFloat) {
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
    }
}

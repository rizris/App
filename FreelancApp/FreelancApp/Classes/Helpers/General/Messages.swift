//
//  Messages.swift
//  FreelancApp
//
//  Created by Rizvi on 9/5/21.
//

import Foundation
import SwiftMessages

class Messages {
    
    class AllertMessages{
        
        /* ==================================================
         Description    :   Use this to show alert in navigation bar
         ================================================== */
        class func messageOnTop(_ description : String,_ themeStyle: Theme) {
            DispatchQueue.main.async(execute: {() -> Void in
                if description.count != 0 {
                    let view = MessageView.viewFromNib(layout: .messageView)
                    view.configureTheme(themeStyle)
                    view.configureDropShadow()
                    view.configureContent(title: description, body: "")
                    view.button?.isHidden = true
                    (view.backgroundView as? CornerRoundingView)?.cornerRadius = 0
                
                    var config = SwiftMessages.Config()
                    config.presentationStyle = .top
                    config.presentationContext = .window(windowLevel: .normal)
                    config.duration = .seconds(seconds: 2)
                    config.dimMode = .gray(interactive: true)
                    config.interactiveHide = true
                    config.preferredStatusBarStyle = .lightContent
                    SwiftMessages.show(config: config, view: view)
                }
            })
        }
    }
}

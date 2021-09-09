//
//  Locale.swift
//  FreelancApp
//
//  Created by Rizvi on 9/6/21.
//

import Foundation

extension Locale {
    
    /*================================================================
    Description : Use to get currency short code
    =================================================================*/
    static func locale(from currencyIdentifier: String) -> Locale? {
        let allLocales = Locale.availableIdentifiers.map({ Locale.init(identifier: $0) })
        return allLocales.filter({ $0.currencyCode == currencyIdentifier }).first
    }
    
    /*================================================================
    Description : Use this method to load currency code from
    =================================================================*/
    static func currencyCode(_ code: String) -> String {
        if let sortCode = self.locale(from: code) {
            if let currencyCode = sortCode.currencySymbol {
                return currencyCode
            }
        }
        return ""
    }
    
}

//
//  LocalizableKey.swift
//  WorldOfPAYBACK
//
//  Created by Vignesh on 04/02/2023.
//

import SwiftUI

enum LocalizableKey: String {
    
    //Common
    case empty = ""
    case success
    case failed
    case all
    case detail
    case recent
    case ok
    case cancel
    case errorNoInternet
    case errorSomethingWrong

    // Transaction
    case transaction
    case totalAmount
    case transactionDetails
    case partnerName
    case categoryA
    case categoryB
    case categoryC
}

extension LocalizedStringKey {
    
    static func localized(_ key: LocalizableKey) -> LocalizedStringKey {
        return LocalizedStringKey(key.rawValue)
    }
    
    static func localized(_ key: String) -> LocalizedStringKey {
        return LocalizedStringKey(key)
    }
    
}

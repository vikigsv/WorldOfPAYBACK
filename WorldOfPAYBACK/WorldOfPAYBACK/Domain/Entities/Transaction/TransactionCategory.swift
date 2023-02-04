//
//  TransactionCategory.swift
//  WorldOfPAYBACK
//
//  Created by Vignesh on 04/02/2023.
//

import SwiftUI


extension Transaction.Item {
    // Category not clear. Assuming a,b,c
    enum Category: Int, CaseIterable {
        case none = 0
        case a = 1
        case b = 2
        case c = 3
    }
}

extension Transaction.Item.Category: Listable {
    
    var description: String {
        switch self {
        case .none:
            return LocalizableKey.all.rawValue
        case .a:
            return LocalizableKey.categoryA.rawValue
        case .b:
            return LocalizableKey.categoryB.rawValue
        case .c:
            return LocalizableKey.categoryC.rawValue
        }
    }
    
}

//
//  TransactionTarget.swift
//  WorldOfPAYBACK
//
//  Created by Vignesh on 04/02/2023.
//

import Foundation

enum TransactionTarget {
    case getTransactions
}

extension TransactionTarget: NetworkTarget {
    
    var path: String {
        switch self {
        case .getTransactions:
            return "/transactions"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getTransactions:
            return .get
        }
    }
    
    var task: NetworkTask {
        switch self {
        case .getTransactions:
            return .requestPlain
        }
    }
    
    var mockData: Data {
        switch self {
        case .getTransactions:
            return BundleFileInventory.transactions.data
        }
    }
    
    var stub: StubType {
        return .delay(1)
    }
    
}

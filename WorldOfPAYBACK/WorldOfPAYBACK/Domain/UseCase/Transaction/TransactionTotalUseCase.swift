//
//  TransactionTotalUseCase.swift
//  WorldOfPAYBACK
//
//  Created by Vignesh on 04/02/2023.
//

import Foundation

class TransactionTotalUseCase: UseCase {

    var items: [Transaction.Item]
    
    init(items: [Transaction.Item]) {
        self.items = items
    }
    
    func execute() -> Double {
        var total: Double = 0
        items.compactMap({ $0.transactionDetail.value.amount }).forEach({ total += $0 })
        return total
    }
}

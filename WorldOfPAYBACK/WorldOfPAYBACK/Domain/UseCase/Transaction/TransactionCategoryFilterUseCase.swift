//
//  TransactionCategoryFilterUseCase.swift
//  WorldOfPAYBACK
//
//  Created by Vignesh on 04/02/2023.
//

import Foundation

class TransactionCategoryFilterUseCase: UseCase {
    
    private let transactionItems: [Transaction.Item]
    private let category: Transaction.Item.Category
    
    init(transactionItems: [Transaction.Item], category: Transaction.Item.Category) {
        self.transactionItems = transactionItems
        self.category = category
    }
    
    func execute() -> [Transaction.Item] {
        return filter()
    }
    
}

extension TransactionCategoryFilterUseCase {
    
    private func filter() -> [Transaction.Item] {
        switch category {
        case .none:
            return transactionItems
        default:
            return transactionItems.filter({ $0.category == category })
        }
    }
    
}

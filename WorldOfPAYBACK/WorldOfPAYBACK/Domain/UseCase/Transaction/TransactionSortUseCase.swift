//
//  TransactionSortUseCase.swift
//  WorldOfPAYBACK
//
//  Created by Vignesh on 04/02/2023.
//

import Foundation

class TransactionSortUseCase: UseCase {
    
    enum SortType: CaseIterable {
        case recent
    }
    
    private let transactionItems: [Transaction.Item]
    private let sortType: SortType
    
    init(transactionItems: [Transaction.Item], sortType: SortType) {
        self.transactionItems = transactionItems
        self.sortType = sortType
    }
    
    func execute() -> [Transaction.Item] {
        return sort()
    }
}

extension TransactionSortUseCase {
        
    private func sort() -> [Transaction.Item] {
        switch sortType {
        case .recent:
            return transactionItems.sorted { first, later in
                guard let firstDate = first.transactionDetail.bookingDate.toNetworkDate(),
                      let laterDate = later.transactionDetail.bookingDate.toNetworkDate() else {
                    return false
                }
                return firstDate > laterDate
            }
        }
    }
}

extension TransactionSortUseCase.SortType: Listable {
    
    var icon: SystemImage? {
        switch self {
        case .recent:
            return .sort
        }
    }
    
    var description: String {
        switch self {
        case .recent:
            return LocalizableKey.recent.rawValue
        }
    }
    
}

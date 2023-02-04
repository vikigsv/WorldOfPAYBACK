//
//  TransactionDetailsViewModel.swift
//  WorldOfPAYBACK
//
//  Created by Vignesh on 04/02/2023.
//

import SwiftUI

class TransactionDetailsViewModel: ViewModel {
    
    @Published var item: Transaction.Item
    
    init(item: Transaction.Item) {
        self.item = item
    }

}

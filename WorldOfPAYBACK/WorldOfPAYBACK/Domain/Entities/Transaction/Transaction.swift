//
//  Transaction.swift
//  WorldOfPAYBACK
//
//  Created by Vignesh on 04/02/2023.
//

import Foundation

class Transaction: DomainEntity {
    var items: [Item]
    @Published var filteredItems: [Item] = []
    var transactionTotal: Double = 0 {
        didSet {
            transactionTotalString = String(format: "%.2f", transactionTotal)
        }
    }
    @Published var transactionTotalString = ""
    
    init(items: [Item]? ) {
        self.items = items ?? []
    }
    
}

extension Transaction {
    
    class Item: DomainEntity, Identifiable {
        var partnerDisplayName: String
        var alias: Alias
        var category: Category
        var transactionDetail: Detail
        
        init(partnerDisplayName: String?, alias: Alias, category: Category, transactionDetail: Detail) {
            self.partnerDisplayName = partnerDisplayName ?? ""
            self.alias = alias
            self.category = category
            self.transactionDetail = transactionDetail
        }
    }
    
}

extension Transaction.Item {

    class Alias: DomainEntity {
        var reference: String
        
        init(reference: String? = nil) {
            self.reference = reference ?? ""
        }
    }

    class Detail: DomainEntity {
        var description: String
        var bookingDate: String
        var value: Value
        var bookingDateOnly: String
        var bookingTimeOnly: String
        
        init(description: String? = nil, bookingDate: String? = nil, value: Value) {
            self.description = description ?? ""
            self.bookingDate = bookingDate ?? ""
            self.value = value
            self.bookingDateOnly = bookingDate?.dateString(toFormat: .displayDate, locale: Locale.current) ?? ""
            self.bookingTimeOnly = bookingDate?.dateString(toFormat: .displayTime, locale: Locale.current) ?? ""
        }
    }
    
}

extension Transaction.Item.Detail {
 
    class Value: DomainEntity {
        // Currency not clear.
        enum Currency: String {
            case none = ""
            case PBP
        }
        var amount: Double?
        var currency: Currency
        var amountString: String
        
        init(amount: Double? = nil, currency: Currency? = nil) {
            self.amount = amount
            self.currency = currency ?? .none
            self.amountString = amount == nil ? "" : String(format: "%.2f", amount!)
        }
    }
    
}

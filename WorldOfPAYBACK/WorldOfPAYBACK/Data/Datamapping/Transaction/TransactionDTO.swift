//
//  TransactionDTO.swift
//  WorldOfPAYBACK
//
//  Created by Vignesh on 04/02/2023.
//

import Foundation

struct TransactionDTO: Decodable {
    var items: [Item]?
}

extension TransactionDTO {
    
    struct Item: Decodable {
        var partnerDisplayName: String?
        var alias: Alias?
        var category: Int?
        var transactionDetail: Detail?
    }
    
}

extension TransactionDTO.Item {
    
    struct Alias: Decodable {
        var reference: String?
    }
    
    struct Detail: Decodable {
        var description: String?
        var bookingDate: String?
        var value: Value?
    }
    
}

extension TransactionDTO.Item.Detail {
    
    struct Value: Decodable {
        var amount: Double?
        var currency: String?
    }
    
}

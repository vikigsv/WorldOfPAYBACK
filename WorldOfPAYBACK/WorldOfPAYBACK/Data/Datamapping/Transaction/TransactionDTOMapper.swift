//
//  TransactionDTOMapper.swift
//  WorldOfPAYBACK
//
//  Created by Vignesh on 04/02/2023.
//

import Foundation

extension TransactionDTO: DomainMapper {
    
    func toDomain() -> Transaction {
        let domain = Transaction(items: items?.compactMap({ $0.toDomain() }))
        return domain
    }
}

extension TransactionDTO.Item: DomainMapper {
    
    func toDomain() -> Transaction.Item {
        let domain = Transaction.Item(partnerDisplayName: partnerDisplayName,
                                     alias: alias?.toDomain() ?? .init(),
                                     category: Transaction.Item.Category(rawValue: category ?? 0) ?? .none,
                                     transactionDetail: transactionDetail?.toDomain() ?? .init(value: .init()))
        return domain
    }
}

extension TransactionDTO.Item.Alias: DomainMapper {
    
    func toDomain() -> Transaction.Item.Alias {
        let domain = Transaction.Item.Alias(reference: reference)
        return domain
    }
    
}

extension TransactionDTO.Item.Detail: DomainMapper {
    
    func toDomain() -> Transaction.Item.Detail {
        let domain = Transaction.Item.Detail(description: description,
                                       bookingDate: bookingDate,
                                       value: value?.toDomain() ?? .init())
        return domain
    }
}

extension TransactionDTO.Item.Detail.Value: DomainMapper {
    
    func toDomain() -> Transaction.Item.Detail.Value {
        let domain = Transaction.Item.Detail.Value(amount: amount,
                                      currency: .init(rawValue: currency ?? ""))
        return domain
    }
}

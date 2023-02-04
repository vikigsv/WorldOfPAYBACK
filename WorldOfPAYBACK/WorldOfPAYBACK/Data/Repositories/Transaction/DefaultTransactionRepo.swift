//
//  DefaultTransactionRepo.swift
//  WorldOfPAYBACK
//
//  Created by Vignesh on 04/02/2023.
//

import Foundation
import Combine

class DefaultTransactionRepo: AppRepository {
    
}

extension DefaultTransactionRepo: TransactionRepository {
    
    func getTransactionsList() -> AnyPublisher<TransactionDTO, NetworkError> {
        return networkProvider.perform(target: TransactionTarget.getTransactions)
    }
    
}

// Repo for demo purpose to have random fail
//
class DemoTransactionRepo: AppRepository {
    
    private var trial = 2
    
}

extension DemoTransactionRepo: TransactionRepository {
    
    func getTransactionsList() -> AnyPublisher<TransactionDTO, NetworkError> {
        if trial == 0 {
            trial = 2
            return Future<TransactionDTO, NetworkError> { promise in
                promise(.failure(.cancelled))
            }
            .eraseToAnyPublisher()
        } else {
            trial -= 1
            return networkProvider.perform(target: TransactionTarget.getTransactions)
        }
    }
    
}


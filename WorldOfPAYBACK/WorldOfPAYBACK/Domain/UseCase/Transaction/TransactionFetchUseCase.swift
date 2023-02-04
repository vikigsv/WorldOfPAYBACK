//
//  TransactionFetchUseCase.swift
//  WorldOfPAYBACK
//
//  Created by Vignesh on 04/02/2023.
//

import Foundation
import Combine

class TransactionFetchUseCase: RepoUseCase {
    
    private var repo: TransactionRepository
    
    init(repo: TransactionRepository) {
        self.repo = repo
    }
    
    func execute() -> AnyPublisher<Transaction, NetworkError> {
        return executeRepo()
    }
    
}

extension TransactionFetchUseCase {
    
    private func executeRepo() -> AnyPublisher<Transaction, NetworkError> {
        repo.getTransactionsList()
            .map({ dto in
                dto.toDomain()
            })
            .eraseToAnyPublisher()
    }
    
}

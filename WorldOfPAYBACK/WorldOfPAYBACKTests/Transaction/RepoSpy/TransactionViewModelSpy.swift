//
//  TransactionViewModelSpy.swift
//  WorldOfPAYBACKTests
//
//  Created by Vignesh on 04/02/2023.
//

import XCTest
import Combine
@testable import WorldOfPAYBACK

class TestTransactionRepoSpy: TransactionRepository {

    func getTransactionsList() -> AnyPublisher<TransactionDTO, NetworkError> {
        Future<TransactionDTO, NetworkError> { promise in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                do {
                    let response = try JSONDecoder().decode(TransactionDTO.self, from: TransactionTarget.getTransactions.mockData)
                    promise(.success(response))
                } catch {
                    promise(.failure(.decodeError(error)))
                }
            }
        }
        .eraseToAnyPublisher()
    }
    
}


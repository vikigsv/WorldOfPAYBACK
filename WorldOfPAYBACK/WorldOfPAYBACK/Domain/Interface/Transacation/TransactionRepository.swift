//
//  TransactionRepository.swift
//  WorldOfPAYBACK
//
//  Created by Vignesh on 04/02/2023.
//

import Foundation
import Combine

protocol TransactionRepository {
    func getTransactionsList() -> AnyPublisher<TransactionDTO, NetworkError>
}

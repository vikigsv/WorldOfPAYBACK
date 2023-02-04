//
//  RepoUseCase.swift
//  WorldOfPAYBACK
//
//  Created by Vignesh on 04/02/2023.
//

import Foundation
import Combine

protocol RepoUseCase {
    associatedtype T
    func execute() -> AnyPublisher<T, NetworkError>
}

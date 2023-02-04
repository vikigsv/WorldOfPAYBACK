//
//  AppNetworkSession.swift
//  WorldOfPayback
//
//  Created by Vignesh on 04/02/2023.
//

import Foundation
import Combine

class AppNetworkSession: NetworkSession {
    
    let session: URLSession
    
    init() {
        let sessionConfiguration = URLSessionConfiguration.default
        session = URLSession(configuration: sessionConfiguration)
    }
    
    func request(request: URLRequest) -> AnyPublisher<URLSession.DataTaskPublisher.Output, NetworkError> {
        return session.dataTaskPublisher(for: request)
            .mapError { error in
                NetworkError.error(error)
            }
            .eraseToAnyPublisher()
    }
    
}

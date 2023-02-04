//
//  Endpoint.swift
//  WorldOfPAYBACK
//
//  Created by Vignesh on 04/02/2023.
//

import Foundation
import Combine

class Endpoint {
    
    let target: NetworkTarget
    
    init(target: NetworkTarget) {
        self.target = target
    }
    
    func urlRequest() -> AnyPublisher<URLRequest, NetworkError> {
        URLConvertible.url(baseUrl: target.baseURL, path: target.path)
            .map({ self.urlRequest(url: $0) })
            .eraseToAnyPublisher()
    }
    
    private func urlRequest(url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = target.method.rawValue
        request.allHTTPHeaderFields = target.headers
        
        switch target.task {
        case .requestPlain:
            return request
        case .requestData(let data):
            request.httpBody = data
            return request
        case .requestJSONEncodable:
            fatalError("Yet to be implemented")
        case .requestCustomJSONEncodable:
            fatalError("Yet to be implemented")
        case .requestParameters:
            fatalError("Yet to be implemented")
        }
    }
    
    
}

//
//  URLConvertible.swift
//  WorldOfPAYBACK
//
//  Created by Vignesh on 04/02/2023.
//

import Foundation
import Combine

final class URLConvertible {
    
    static func url(baseUrl: URL, path: String, queryItems: [URLQueryItem] = []) -> AnyPublisher<URL, NetworkError> {
        Future<URL, NetworkError> { promise in
            var urlComponents = URLComponents(string: baseUrl.absoluteString)
            urlComponents?.path =  path
            if queryItems.count > 0 {
                urlComponents?.queryItems = queryItems
            }
            if let url = urlComponents?.url {
                promise(.success(url))
            } else {
                promise(.failure(NetworkError.invalidURL))
            }
        }
        .eraseToAnyPublisher()
    }
    
}

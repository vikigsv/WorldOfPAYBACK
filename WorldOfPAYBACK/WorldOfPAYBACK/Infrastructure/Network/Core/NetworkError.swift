//
//  NetworkError.swift
//  WorldOfPayback
//
//  Created by Vignesh on 04/02/2023.
//

import Foundation

public enum NetworkError: Error {
    case error(statusCode: Int)
    case error(Error)
    case invalidURL
    case notConnected
    case cancelled
    case decodeError(Error?)
    case unknown
}

extension NetworkError: CustomStringConvertible {
    
    public var description: String {
        switch self {
        case .notConnected:
            return LocalizableKey.errorNoInternet.rawValue
        default:
            return LocalizableKey.errorSomethingWrong.rawValue
            
        }
    }
}

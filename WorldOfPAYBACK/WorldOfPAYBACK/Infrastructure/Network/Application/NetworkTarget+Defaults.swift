//
//  AppEndpoint.swift
//  WorldOfPayback
//
//  Created by Vignesh on 04/02/2023.
//

import Foundation

public extension NetworkTarget {
    
    var baseURL: URL {
        return AppNetworkConfiguration.appEnvironment.baseURL
    }
    
    var headers: [String : String]? {
        return [:]
    }
    
    var statusCodeValidationType: NetworkStatusCodeValidationType {
        return .successCodes
    }
    
}

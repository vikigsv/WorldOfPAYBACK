//
//  AppEnvironment.swift
//  WorldOfPayback
//
//  Created by Vignesh on 04/02/2023.
//

import Foundation

enum AppEnvironment {
    case production
    case develop
    
    var baseURL: URL {
        guard let url = URL(string: baseURLString) else {
            fatalError("Invalid")
        }
        return url
    }
    
    var baseURLString: String {
        switch self {
        case .production:
            return AppNetworkConfiguration.productionURL
        case .develop:
            return AppNetworkConfiguration.developmentURL
        }
    }
}

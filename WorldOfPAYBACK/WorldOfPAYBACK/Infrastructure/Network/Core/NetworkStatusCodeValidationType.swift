//
//  NetworkStatusCodeValidationType.swift
//  WorldOfPAYBACK
//
//  Created by Vignesh on 04/02/2023.
//

import Foundation

public enum NetworkStatusCodeValidationType {
    case none
    case successCodes
    case successAndRedirectCodes
    case customCodes(Range<Int>)

    var statusCodes: Range<Int>? {
        switch self {
        case .successCodes:
            return 200..<300
        case .successAndRedirectCodes:
            return 200..<400
        case .customCodes(let codes):
            return codes
        case .none:
            return nil
        }
    }
}


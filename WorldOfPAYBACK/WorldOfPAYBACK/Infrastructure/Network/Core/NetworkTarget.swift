//
//  Endpoint.swift
//  WorldOfPayback
//
//  Created by Vignesh on 04/02/2023.
//

import Foundation

public enum StubType {
    case never
    case now
    case delay(TimeInterval)
}

public protocol NetworkTarget {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var task: NetworkTask { get }
    var headers: [String: String]? { get }
    var mockData: Data { get }
    var statusCodeValidationType: NetworkStatusCodeValidationType { get }
    var stub: StubType { get }
}

//
//  Task.swift
//  WorldOfPayback
//
//  Created by Vignesh on 04/02/2023.
//

import Foundation

public enum NetworkTask {
    case requestPlain
    case requestData(Data)
    case requestJSONEncodable(Encodable)
    case requestCustomJSONEncodable(Encodable, encoder: JSONEncoder)
    case requestParameters([String: Any])
}

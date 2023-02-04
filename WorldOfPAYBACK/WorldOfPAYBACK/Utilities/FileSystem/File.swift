//
//  File.swift
//  WorldOfPAYBACK
//
//  Created by Vignesh on 04/02/2023.
//

import Foundation

public struct File {
    
    public static func jsonData(fileName: String, bundle: Bundle = Bundle.main) -> Data {
        guard let path = bundle.url(forResource: fileName, withExtension: "json"),
              let data = try? Data(contentsOf: path) else {
            return "{}".data(using: String.Encoding.utf8)!
        }
        return data
    }
}

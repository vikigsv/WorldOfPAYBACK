//
//  BundleFileInventory.swift
//  WorldOfPAYBACK
//
//  Created by Vignesh on 04/02/2023.
//

import Foundation

enum BundleFileInventory: String {
    case transactions = "PBTransactions"
}


extension BundleFileInventory {
    var data: Data {
        return File.jsonData(fileName: rawValue)
    }
}

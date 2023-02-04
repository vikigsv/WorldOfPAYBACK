//
//  AppRepository.swift
//  WorldOfPAYBACK
//
//  Created by Vignesh on 04/02/2023.
//

import Foundation

class AppRepository {
    
    let networkProvider: NetworkProvider
    
    init() {
        let session = AppNetworkSession()
        networkProvider = NetworkProvider(session: session)
    }
    
}

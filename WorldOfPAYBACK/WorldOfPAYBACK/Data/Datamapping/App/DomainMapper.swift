//
//  DomainMapper.swift
//  WorldOfPAYBACK
//
//  Created by Vignesh on 04/02/2023.
//

import Foundation

protocol DomainMapper {
    associatedtype T
    func toDomain() -> T
}

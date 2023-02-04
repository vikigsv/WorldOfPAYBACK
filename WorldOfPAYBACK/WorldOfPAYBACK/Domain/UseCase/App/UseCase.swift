//
//  UseCase.swift
//  WorldOfPAYBACK
//
//  Created by Vignesh on 04/02/2023.
//

import Foundation

protocol UseCase {
    associatedtype T
    func execute() -> T
}

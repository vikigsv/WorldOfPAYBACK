//
//  ColorPalette.swift
//  WorldOfPAYBACK
//
//  Created by Vignesh on 04/02/2023.
//

import SwiftUI

enum ColorPalette: String {
    case primary

}

extension ColorPalette {
    
    func color() -> Color {
        return Color(rawValue)
    }
}

extension Color {
    
    static func palette(_ type: ColorPalette) -> Color {
        return type.color()
    }
    
}

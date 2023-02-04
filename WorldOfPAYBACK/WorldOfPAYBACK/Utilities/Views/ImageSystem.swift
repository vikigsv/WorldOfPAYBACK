//
//  ImageSystem.swift
//  WorldOfPAYBACK
//
//  Created by Vignesh on 04/02/2023.
//

import SwiftUI

struct ImageSystem: View {
    var systemImage: SystemImage
    
    var body: some View {
        Image(systemName: systemImage.rawValue)
    }
}

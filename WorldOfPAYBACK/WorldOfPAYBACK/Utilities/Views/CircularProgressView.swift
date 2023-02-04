//
//  CircularProgressView.swift
//  WorldOfPAYBACK
//
//  Created by Vignesh on 04/02/2023.
//

import SwiftUI

struct CircularProgressView: View {
    
    @Binding var show: Bool
    
    var body: some View {
        if show {
            GeometryReader { metric in
                VStack(alignment: .center, content: {
                    ProgressView()
                })
                .frame(width: metric.size.width, height: metric.size.height)
                .background(Color.black.opacity(0.2))
            }
        }
    }
}

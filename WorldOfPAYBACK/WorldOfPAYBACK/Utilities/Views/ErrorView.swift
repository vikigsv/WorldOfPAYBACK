//
//  ErrorView.swift
//  WorldOfPAYBACK
//
//  Created by Vignesh on 04/02/2023.
//

import SwiftUI

struct ErrorView: View {
    
    struct ErrorViewData {
        var title: String = ""
        var description: String = ""
    }
    
    @Binding var data: ErrorViewData
    @Binding var show: Bool
    var action: (() -> Void)
    
    var body: some View {
        if show == true {
            HStack {
                Spacer()
                VStack(alignment: .center) {
                    Spacer()
                    Text(.localized(data.title))
                        .font(.largeTitle)
                    Text(.localized(data.description))
                        .font(.title)
                        .foregroundColor(.gray)
                    
                    Button(.localized(.ok), action: action)
                        .buttonStyle(.plain)
                        .background(Color.palette(.primary))
                    Spacer()
                }
                Spacer()
            }
            .background(Color.white)
            .frame(maxWidth: .infinity)
        }
    }
}

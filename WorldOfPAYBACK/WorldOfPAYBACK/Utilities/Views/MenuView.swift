//
//  MenuView.swift
//  WorldOfPAYBACK
//
//  Created by Vignesh on 04/02/2023.
//

import SwiftUI

protocol Listable: CaseIterable, CustomStringConvertible, Hashable {
    
    var icon: SystemImage? { get }
}

extension Listable {
    
    var icon: SystemImage? { return nil }
}

struct MenuView<T: Listable>: View {
    
    @Binding var selected: T
    
    var body: some View {
        Menu {
            ForEach(Array(T.allCases), id: \.self, content: { type in
                Button(.localized(type.description)) {
                    selected = type
                }
            })
        } label: {
            HStack {
                if let icon = selected.icon {
                    ImageSystem(systemImage: icon)
                }
                Text(.localized(selected.description))
                ImageSystem(systemImage: .down)
            }
            .foregroundColor(.palette(.primary))
        }
    }
}

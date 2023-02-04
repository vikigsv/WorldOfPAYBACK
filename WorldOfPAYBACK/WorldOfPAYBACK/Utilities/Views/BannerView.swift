//
//  BannerView.swift
//  WorldOfPAYBACK
//
//  Created by Vignesh on 04/02/2023.
//

import SwiftUI

struct BannerView: View {
    
    struct BannerData {
        var title: String = ""
        var detail: String = ""
        var type: BannerType = .info
    }
    
    enum BannerType {
        case info
        case warning
        case success
        case error
        
        var tintColor: Color {
            switch self {
            case .info:
                return Color(red: 67/255, green: 154/255, blue: 215/255)
            case .success:
                return Color.green
            case .warning:
                return Color.yellow
            case .error:
                return Color.red
            }
        }
    }
    
    // Members for the Banner
    @Binding var data: BannerData
    @Binding var show: Bool
    
    var body: some View {
        ZStack {
            if show {
                VStack {
                    HStack {
                        VStack(alignment: .leading, spacing: 2) {
                            Text(.localized(data.title))
                                .bold()
                            Text(.localized(data.detail))
                                .font(Font.system(size: 15, weight: Font.Weight.light, design: Font.Design.default))
                        }
                        Spacer()
                    }
                    .foregroundColor(Color.white)
                    .padding(12)
                    .background(data.type.tintColor)
                    .cornerRadius(8)
                    Spacer()
                }
                .padding()
                .animation(.linear, value: true)
                .transition(AnyTransition.move(edge: .top).combined(with: .opacity))
                .onTapGesture {
                    withAnimation {
                        self.show = false
                    }
                }.onAppear(perform: {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation {
                            self.show = false
                        }
                    }
                })
            }
        }
    }

}

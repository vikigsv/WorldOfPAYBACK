//
//  TextViewModifier.swift
//  WorldOfPAYBACK
//
//  Created by Vignesh on 04/02/2023.
//

import SwiftUI

fileprivate struct TextSubHeadlineViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.black)
            .font(.subheadline)
    }
}

fileprivate struct TextCaptionViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.gray)
            .font(.subheadline)
    }
}

fileprivate struct TextCaptionLightViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.gray)
            .font(.footnote)
    }
}


extension Text {
    
    func subHeadline() -> some View {
        modifier(TextSubHeadlineViewModifier())
    }
    
    func primarySubHeadline() -> some View {
        foregroundColor(Color.palette(.primary))
            .bold()
            .modifier(TextSubHeadlineViewModifier())
    }
    
    func caption() -> some View {
        modifier(TextCaptionViewModifier())
    }
    
    func captionLight() -> some View {
        modifier(TextCaptionLightViewModifier())
    }
}

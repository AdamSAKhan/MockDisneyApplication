//
//  ViewModifiers.swift
//  DisneyApplication
//
//  Created by Adam Khan on 24/01/2023.
//

import SwiftUI

internal struct imageListViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .cornerRadius(20)
            .shadow(radius: 10)
            .padding()
    }
}

internal struct listTextModifiers: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title3)
            .shadow(radius: 1)
            .background{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.gray)
                    .opacity(0.1)
                    .blur(radius: 10)
        }
    }
}

extension View {
    
    func listTextModifier() -> some View {
        self.modifier(listTextModifiers())
    }
    
    func imageListModifier() -> some View {
        self.modifier(imageListViewModifier())
    }
}

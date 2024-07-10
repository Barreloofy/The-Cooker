//
//  ListPlaceholderModifier.swift
//  The Cooker
//
//  Created by Nils on 7/10/24.
//

import SwiftUI


struct ListPlaceholderModifier<Placeholder: View>: ViewModifier {

    let items: [Any]
    let placeholder: Placeholder

    @ViewBuilder
    func body(content: Content) -> some View {
        if !items.isEmpty {
            content
        } else {
            placeholder
        }
    }
}


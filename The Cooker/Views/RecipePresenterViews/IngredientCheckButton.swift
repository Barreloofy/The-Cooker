//
//  IngredientCheckButton.swift
//  The Cooker
//
//  Created by Nils on 6/27/24.
//

import SwiftUI

struct IngredientCheckButton: View {
    var ingredient: Ingredient
    @State var wasPressedIngredient = false
    var body: some View {
        
        Button(action: {
            wasPressedIngredient.toggle()
        }, label: {
            if wasPressedIngredient {
                Label("\(ingredient.description)", systemImage: "circle.circle.fill").opacity(0.5).foregroundColor(.gray)
            } else {
                Label("\(ingredient.description)", systemImage: "circle")
            }
        })
    }
}

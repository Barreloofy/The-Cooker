//
//  ForEachIngredient.swift
//  The Cooker
//
//  Created by Nils on 6/20/24.
//

import SwiftUI

struct ForEachIngredient: View {
    @Binding var ingredientElement: Ingredient
    var body: some View {
        
            TextField("Ingredient Name", text: $ingredientElement.name)
            Picker("Ingredient Unit", selection: $ingredientElement.unit) {
                ForEach(Ingredient.Unit.allCases, id: \.self) {unit in
                    Text(unit.rawValue)
                }
            }
            TextField("Ingredient Quantity", value: $ingredientElement.quantity, format: .number)
    }
}

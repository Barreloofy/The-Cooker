//
//  IngredientPresenterView.swift
//  The Cooker
//
//  Created by Nils on 7/1/24.
//

import SwiftUI

struct IngredientPresenterView: View {
    
    @Binding var ingredient: Ingredient
    var body: some View {
        NavigationStack {
            Form {
                HStack {
                    Text("Name:")
                    TextField("No Name", text:$ingredient.name)
                }
                Picker("Unit", selection: $ingredient.unit) {
                    ForEach(Ingredient.Unit.allCases, id: \.self) {unit in
                        Text("\(unit.rawValue)")
                    }
                }
                HStack {
                    Text("Quantity:")
                    TextField("No Quantity", value: $ingredient.quantity, format: .number)
                        .keyboardType(.numbersAndPunctuation)
                }
            }
        }
        .navigationTitle("Ingredient")
        .navigationBarBackButtonHidden(true)
        .toolbar {
            DoneButton()
        }
        .tint(.blue)
    }
}

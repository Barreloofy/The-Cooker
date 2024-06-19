//
//  AddRecipeView.swift
//  The Cooker
//
//  Created by Nils on 6/17/24.
//

import SwiftUI

struct AddRecipeView: View {
    @ObservedObject var userData: UserData
    @State private var mainInformation: MainInformation = MainInformation(name: "", description: "", author: "", category: .breakfast)
    @State private var ingredients = [Ingredient(name: "", quantity: 0.0, unit: .none)]
    @State private var directions = [Direction(description: "", isOptional: false)]
    //@State private var showTextField = false
    var body: some View {
        Form {
            Section(header: Text("Recipe Info")) {
                TextField("Recipe Name", text: $mainInformation.name)
                TextField("Recipe Author", text: $mainInformation.author)
                TextField("Recipe Description", text: $mainInformation.description)
                Picker("Recipe Category", selection: $mainInformation.category) {
                    ForEach(MainInformation.Category.allCases, id: \.self) {category in
                        Text(category.rawValue)
                    }
                }
            }
            Section(header: Text("Ingredients")) {
                ForEach($ingredients) {ingredientElement in
                    VStack {
                    TextField("Ingredient Name", text: ingredientElement.name)
                        Picker("Ingredient Unit", selection: ingredientElement.unit) {
                        ForEach(Ingredient.Unit.allCases, id: \.self) {unit in
                            Text(unit.rawValue)
                        }
                    }
                    TextField("Ingredient Quantity", value: ingredientElement.quantity, format: .number)
                 }
               }
            }
        }
    }
}

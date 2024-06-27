//
//  EditView.swift
//  The Cooker
//
//  Created by Nils on 6/24/24.
//

import SwiftUI

struct EditView: View {
    
    @Binding var showEditSheet: Bool
    @ObservedObject var userData: UserData
    @State var currentRecipe: Recipe
    var body: some View {
        NavigationView {
        Form {
            Section(header: Text("Main Information")) {
                TextField("\(currentRecipe.mainInformation.name)", text: $currentRecipe.mainInformation.name)
                TextField("\(currentRecipe.mainInformation.author)", text: $currentRecipe.mainInformation.author)
                ZStack {
                    TextEditor(text: $currentRecipe.mainInformation.description)
                    Text(currentRecipe.mainInformation.description)
                        .opacity(0)
                }
            }
            Section(header: Text("Ingredients")) {
                ForEach(currentRecipe.ingredients.indices, id: \.self) {index in
                    Text("Ingredient: \(index+1)")
                    TextField(("\(currentRecipe.ingredients[index].name)"), text: $currentRecipe.ingredients[index].name)
                    Picker("Unit", selection: $currentRecipe.ingredients[index].unit) {
                        Text("Cups").tag(Ingredient.Unit.cups)
                        Text("Gram").tag(Ingredient.Unit.g)
                        Text("Ounces").tag(Ingredient.Unit.oz)
                        Text("Tablespoons").tag(Ingredient.Unit.tbs)
                        Text("Teaspoons").tag(Ingredient.Unit.tsp)
                        Text("No Unit").tag(Ingredient.Unit.none)
                    }
                    @State var unitNotNone = currentRecipe.ingredients[index].unit != .none
                    if unitNotNone {
                        TextField("Quantity", value: $currentRecipe.ingredients[index].quantity, format: .number)
                            .keyboardType(.numbersAndPunctuation)
                    }
                }
            }
            Section(header: Text("Directions")) {
                ForEach(currentRecipe.directions.indices, id: \.self) {index in
                    Text("Step: \(index+1)")
                    ZStack {
                        TextEditor(text: $currentRecipe.directions[index].description)
                        Text(currentRecipe.directions[index].description)
                            .opacity(0)
                    }
                    Toggle("Optional Step?", isOn: $currentRecipe.directions[index].isOptional)
                }
            }
        }
        .tint(.black)
        .toolbar {
            ToolbarItem {
                Button("Save", action: {
                    userData.saveModifications(currentRecipe)
                    showEditSheet.toggle()
                })
            }
        }
    }
  }
}

//
//  AddRecipeView.swift
//  The Cooker
//
//  Created by Nils on 6/17/24.
//

import SwiftUI

struct AddRecipeView: View {
    @State private var userRecipe = Recipe(mainInformation: MainInformation(name: "", description: "", author: "", category: .breakfast), ingredients: [Ingredient(name: "", quantity: 0.0, unit: .none)], directions: [Direction(description: "Add your Recipe`s Directions here...", isOptional: false)])
    enum isOptionalPicker: CaseIterable {
        case Yes
        case No
    }
    var body: some View {
        Form {
            // mainInformation text entry fields.
            Section(header: Text("Recipe Info")) {
                TextField("Recipe Name", text: $userRecipe.mainInformation.name)
                TextField("Author", text: $userRecipe.mainInformation.author)
                TextField("Description", text: $userRecipe.mainInformation.description)
                Picker("Recipe Category", selection: $userRecipe.mainInformation.category) {
                    ForEach(MainInformation.Category.allCases, id: \.self) {category in
                        Text(category.rawValue)
                    }
                }
            }.tint(Color.blue)
            Section(header: Text("Ingredients")) {
                ForEach(userRecipe.ingredients.indices, id: \.self) {ingredientElement in
                    ForEachIngredient(ingredientElement: $userRecipe.ingredients[ingredientElement])
                }
                Button(action: {
                    userRecipe.ingredients.append(Ingredient(name: "", quantity: 0.0, unit: .none))
                }, label: {
                    Image(systemName: "plus")
                })
            }.tint(Color.blue)
            Section(header: Text("Directions")) {
                ForEach($userRecipe.directions.indices, id: \.self) {directionElement in
                    TextEditor(text: $userRecipe.directions[directionElement].description)
                    Toggle(" Optional step?", isOn: $userRecipe.directions[directionElement].isOptional).tint(Color.blue)
                }
                Button(action: {
                    userRecipe.directions.append(Direction(description: "Add your Recipe`s Directions here...", isOptional: false))
                }, label: {
                   Image(systemName: "plus")
                })
            }.tint(Color.blue)
        }
    }
}

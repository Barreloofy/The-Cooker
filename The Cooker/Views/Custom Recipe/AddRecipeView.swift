//
//  AddRecipeView.swift
//  The Cooker
//
//  Created by Nils on 6/17/24.
//

import SwiftUI

struct AddRecipeView: View {
    
    @EnvironmentObject private var recipeData: RecipeData
    
    @State private var showAlert = false
    @Environment (\.dismiss) private var dismiss
    @State private var userRecipe = Recipe()
    enum isOptionalPicker: CaseIterable {
        case Yes
        case No
    }
    var body: some View {
        NavigationView {
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
                // Ingredients section
                Section(header: Text("Ingredients")) {
                    ForEach(userRecipe.ingredients.indices, id: \.self) {ingredientElement in
                        Text("Ingredient \(ingredientElement+1)")
                        ForEachIngredient(ingredientElement: $userRecipe.ingredients[ingredientElement])
                    }
                    Button(action: {
                        userRecipe.ingredients.append(Ingredient(name: "", quantity: 0.0, unit: .none))
                    }, label: {
                        Image(systemName: "plus")
                    })
                }.tint(Color.blue)
                // Directions section
                Section(header: Text("Directions")) {
                    ForEach($userRecipe.directions.indices, id: \.self) {directionElement in
                        Text("Direction \(directionElement+1)")
                        TextEditor(text: $userRecipe.directions[directionElement].description)
                        Toggle(" Optional step?", isOn: $userRecipe.directions[directionElement].isOptional).tint(Color.blue)
                    }
                    Button(action: {
                        userRecipe.directions.append(Direction(description: "Add your Recipe`s Directions here...", isOptional: false))
                    }, label: {
                        Image(systemName: "plus")
                    })
                }.tint(.blue)
                // Image section
                Section(header: Text("Add Image")) {
                    AddImageButton(customImage: $userRecipe.customImage)
                }
            }
            // Save Button
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        if userRecipe.mainInformation.name != "" {
                            recipeData.addRecipe(userRecipe)
                            userRecipe = Recipe()
                            dismiss()
                        } else {
                            showAlert.toggle()
                        }
                    },
                           label: {
                        Text("Save")
                            .font(.subheadline)
                            .bold()
                            .foregroundStyle(Color.blue)
                    })
                }
            }
            .padding(.top, -25)
            // Alert if recipe name is default
            .alert("Provide a recipe name first!", isPresented: $showAlert) {
                Button("OK", role: .cancel) {}
        }
      }
    }
}

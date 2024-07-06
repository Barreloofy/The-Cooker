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
        NavigationStack {
            Form {
                // mainInformation text entry fields.
                Section(header: Text("Recipe Info")) {
                    TextField("Recipe Name", text: $userRecipe.mainInformation.name)
                    TextField("Author", text: $userRecipe.mainInformation.author)
                    ZStack {
                        if userRecipe.mainInformation.description.isEmpty {
                            TextEditor(text: .constant("Description"))
                                .opacity(0.25)
                        }
                        TextEditor(text: $userRecipe.mainInformation.description)
                    }
                    .padding(.leading, -2)
                    Picker("Recipe Category", selection: $userRecipe.mainInformation.category) {
                        ForEach(MainInformation.Category.allCases, id: \.self) {category in
                            Text(category.rawValue)
                        }
                    }
                }.tint(Color.blue)
                // Ingredients section
                Section(header: Text("Ingredients")) {
                    ForEach(userRecipe.ingredients.indices, id: \.self) {ingredientIndex in
                        NavigationLink(destination: IngredientPresenterView(ingredient: $userRecipe.ingredients[ingredientIndex])) {
                            Text("\(userRecipe.ingredients[ingredientIndex].name.isEmpty ? "New Ingredient" : userRecipe.ingredients[ingredientIndex].name)")
                        }
                    }
                    .onMove(perform: { indices, newOffset in
                        userRecipe.ingredients.move(fromOffsets: indices, toOffset: newOffset)
                    })
                    Button(action: {
                        userRecipe.ingredients.append(Ingredient(name: "", quantity: 0.0, unit: .none))
                    }, label: {
                        Image(systemName: "plus")
                    })
                }.tint(Color.blue)
                // Directions section
                Section(header: Text("Directions")) {
                    ForEach($userRecipe.directions.indices, id: \.self) {directionIndex in
                        NavigationLink(destination: DirectionPresenterView(direction: $userRecipe.directions[directionIndex])) {
                            Text("\(userRecipe.directions[directionIndex].description.isEmpty ? "New Direction" : userRecipe.directions[directionIndex].description)")
                        }
                    }
                    .onMove(perform: { indices, newOffset in
                        userRecipe.directions.move(fromOffsets: indices, toOffset: newOffset)
                    })
                    Button(action: {
                        userRecipe.directions.append(Direction())
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

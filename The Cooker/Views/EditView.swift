//
//  EditView.swift
//  The Cooker
//
//  Created by Nils on 6/24/24.
//

import SwiftUI

struct EditView: View {
    
    @State private var showAlert = false
    @EnvironmentObject private var recipeData: RecipeData
    @Binding var showEditSheet: Bool
    @State var currentRecipe: Recipe
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Main Information")) {
                    TextField("Recipe Name", text: $currentRecipe.mainInformation.name)
                    TextField("Author", text: $currentRecipe.mainInformation.author)
                    ZStack {
                        if currentRecipe.mainInformation.description.isEmpty {
                            TextEditor(text: .constant("Description"))
                                .opacity(0.25)
                        }
                        TextEditor(text: $currentRecipe.mainInformation.description)
                        Text(currentRecipe.mainInformation.description)
                            .opacity(0)
                    }
                    .padding(.leading, -2)
                }
                // Ingredients Section
                Section(header: Text("Ingredients")) {
                    ForEach(currentRecipe.ingredients.indices, id: \.self) {index in
                        NavigationLink("\(currentRecipe.ingredients[index].name == "" ? "New Ingredient" : currentRecipe.ingredients[index].name)") {
                            IngredientPresenterView(ingredient: $currentRecipe.ingredients[index])
                        }
                        .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                            Button("Delete") {
                                currentRecipe.ingredients.remove(at: index)
                            }
                        }
                        .tint(.red)
                    }
                    .onMove(perform: { indices, newOffset in
                        currentRecipe.ingredients.move(fromOffsets: indices, toOffset: newOffset)
                    })
                    Button(action: {
                        currentRecipe.ingredients.append(Ingredient())
                    }, label: {
                        Image(systemName: "plus")
                    })
                }
                // Directions Section
                Section(header: Text("Directions")) {
                    ForEach(currentRecipe.directions.indices, id: \.self) {index in
                        NavigationLink("\(currentRecipe.directions[index].description.isEmpty ? "New Direction" : currentRecipe.directions[index].description)") {
                            DirectionPresenterView(direction: $currentRecipe.directions[index])
                        }
                        .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                            Button("Delete") {
                                currentRecipe.directions.remove(at: index)
                            }
                        }
                        .tint(.red)
                    }
                    .onMove(perform: { indices, newOffset in
                        currentRecipe.directions.move(fromOffsets: indices, toOffset: newOffset)
                    })
                    Button(action: {
                        currentRecipe.directions.append(Direction())
                    },
                           label: {
                        Image(systemName: "plus")
                    })
                }
                // Image Section
                Section(header: Text("Image")) {
                    AddImageButton(customImage: $currentRecipe.customImage)
                }
            }
            .toolbar {
                ToolbarItem {
                    Button("Save", action: {
                        if !currentRecipe.mainInformation.name.isEmpty {
                            recipeData.saveModifications(currentRecipe)
                            showEditSheet.toggle()
                        } else {
                            showAlert.toggle()
                        }
          })
        }
      }
            .alert("Provide a recipe name first!", isPresented: $showAlert) {}
    }
  }
}

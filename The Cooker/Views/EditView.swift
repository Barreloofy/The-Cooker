//
//  EditView.swift
//  The Cooker
//
//  Created by Nils on 6/24/24.
//

import SwiftUI

struct EditView: View {
    
    @EnvironmentObject private var recipeData: RecipeData
    @Binding var showEditSheet: Bool
    @State var currentRecipe: Recipe
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Main Information")) {
                    if currentRecipe.mainInformation.name != "" {
                        TextField("\(currentRecipe.mainInformation.name)", text: $currentRecipe.mainInformation.name)
                    } else {
                        TextField("Recipe Name", text: $currentRecipe.mainInformation.name)
                    }
                    if currentRecipe.mainInformation.author != "" {
                        TextField("\(currentRecipe.mainInformation.author)", text: $currentRecipe.mainInformation.author)
                    } else {
                        TextField("Author", text: $currentRecipe.mainInformation.author)
                    }
                    ZStack {
                        TextEditor(text: $currentRecipe.mainInformation.description)
                        Text(currentRecipe.mainInformation.description)
                            .opacity(0)
                    }
                    .padding(.leading, -2)
                }
                Section(header: Text("Ingredients")) {
                    ForEach(currentRecipe.ingredients.indices, id: \.self) {index in
                        NavigationLink("\(currentRecipe.ingredients[index].name)") {
                            IngredientPresenterView(ingredient: $currentRecipe.ingredients[index])
                        }
                        .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                            Button("Delete") {
                                currentRecipe.ingredients.remove(at: index)
                            }
                        }
                        .tint(.red)
                    }
                    Button(action: {
                        currentRecipe.ingredients.append(Ingredient())
                    }, label: {
                        Image(systemName: "plus")
                    })
                }
                Section(header: Text("Directions")) {
                    ForEach(currentRecipe.directions.indices, id: \.self) {index in
                        NavigationLink("\(currentRecipe.directions[index].description)") {
                            DirectionPresenterView(direction: $currentRecipe.directions[index])
                        }
                        .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                            Button("Delete") {
                                currentRecipe.directions.remove(at: index)
                            }
                        }
                        .tint(.red)
                    }
                    Button(action: {
                        currentRecipe.directions.append(Direction())
                    },
                           label: {
                        Image(systemName: "plus")
                    })
                }
            }
            .toolbar {
                ToolbarItem {
                    Button("Save", action: {
                        recipeData.saveModifications(currentRecipe)
                        showEditSheet.toggle()
          })
        }
      }
    }
  }
}

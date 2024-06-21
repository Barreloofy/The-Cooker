//
//  RecipeListView.swift
//  The Cooker
//
//  Created by Nils on 6/15/24.
//

import SwiftUI

struct RecipeListView: View {
    var currentRecipe: Recipe
    @State var wasPressedIngredient: [Bool]
    @State var wasPressedDirection: [Bool]
    var body: some View {
        List {
            Section(header: Text("ingredients")){
                
                ForEach(currentRecipe.ingredients.indices) {ingredientIndex in
                    Button(action: {
                        wasPressedIngredient[ingredientIndex].toggle()
                    }, label: {
                        if wasPressedIngredient[ingredientIndex] {
                         Label("\(currentRecipe.ingredients[ingredientIndex].description)", systemImage: "circle.circle.fill").opacity(0.5).foregroundColor(.gray)
                        } else {
                            Label("\(currentRecipe.ingredients[ingredientIndex].description)", systemImage: "circle")
                        }
                    })
                }
            
            }
            Section(header: Text("Directions")){
                ForEach(currentRecipe.directions.indices) {directionIndex in
                    Button(action: {
                        wasPressedDirection[directionIndex].toggle()
                    }, label: {
                        if wasPressedDirection[directionIndex] {
                            if currentRecipe.directions[directionIndex].isOptional {
                                Label("(Optional) \(currentRecipe.directions[directionIndex].description)", systemImage: "circle.circle.fill").opacity(0.5).foregroundColor(.gray)
                                    .padding(5)
                            } else {
                                Label("\(currentRecipe.directions[directionIndex].description)", systemImage: "circle.circle.fill").opacity(0.5).foregroundColor(.gray)
                                    .padding(5)
                            }
                        } else {
                            if currentRecipe.directions[directionIndex].isOptional {
                                Label("(Optional) \(currentRecipe.directions[directionIndex].description)", systemImage: "circle")
                            } else {
                                Label("\(currentRecipe.directions[directionIndex].description)", systemImage: "circle")
                            }
                        }
                    })
                }
            }
        }
        .listStyle(PlainListStyle())
    }
}

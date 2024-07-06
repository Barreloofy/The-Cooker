//
//  RecipeListView.swift
//  The Cooker
//
//  Created by Nils on 6/15/24.
//

import SwiftUI

struct RecipeListView: View {
    
    var currentRecipe: Recipe
    var body: some View {
        List {
            Section(header: Text("ingredients")){
                
                if currentRecipe.ingredients.isEmpty {
                    Text("No Ingredients")
                }
                
                ForEach(currentRecipe.ingredients.indices, id: \.self) {ingredientIndex in
                    let ingredient = currentRecipe.ingredients[ingredientIndex]
                    if !ingredient.name.isEmpty {
                        IngredientCheckButton(ingredient: ingredient)
                    }
                }
            }
            Section(header: Text("Directions")){
                
                if currentRecipe.directions.isEmpty {
                    Text("No Directions")
                }
                
                ForEach(currentRecipe.directions.indices, id: \.self) {directionIndex in
                    let direction = currentRecipe.directions[directionIndex]
                    if !direction.description.isEmpty {
                        DirectionCheckButton(direction: direction)
                    }
                }
            }
        }
        .foregroundStyle(Color.black)
    }
}

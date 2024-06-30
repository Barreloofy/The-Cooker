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
                
                ForEach(currentRecipe.ingredients.indices, id: \.self) {ingredientIndex in
                    let ingredient = currentRecipe.ingredients[ingredientIndex]
                    IngredientCheckButton(ingredient: ingredient)
                }
            }
            Section(header: Text("Directions")){
                ForEach(currentRecipe.directions.indices, id: \.self) {directionIndex in
                    let direction = currentRecipe.directions[directionIndex]
                    DirectionCheckButton(direction: direction)
                }
            }
        }
        .foregroundStyle(Color.black)
    }
}

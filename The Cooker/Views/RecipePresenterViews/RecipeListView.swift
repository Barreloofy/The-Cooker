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
                    IngredientCheckButton(ingredient: currentRecipe.ingredients[ingredientIndex])
                }
            
            }
            Section(header: Text("Directions")){
                ForEach(currentRecipe.directions.indices, id: \.self) {directionIndex in
                    DirectionCheckButton(direction: currentRecipe.directions[directionIndex])
                }
            }
        }
        .listStyle(PlainListStyle())
    }
}

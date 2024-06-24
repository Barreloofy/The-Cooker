//
//  RecipeView.swift
//  The Cooker
//
//  Created by Nils on 6/7/24.
//

import SwiftUI

struct RecipeView: View {
    var currentRecipe: Recipe
    
    var body: some View {
        
        VStack {
            RecipeNonListViews(currentRecipe: currentRecipe)
            RecipeListView(currentRecipe: currentRecipe, wasPressedIngredient: Array(repeating: false, count: currentRecipe.ingredients.count), wasPressedDirection: Array(repeating: false, count: currentRecipe.directions.count))
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {}, label: {
                    Image(systemName: "pencil.circle")
                })
            }
        }
    
    }
}

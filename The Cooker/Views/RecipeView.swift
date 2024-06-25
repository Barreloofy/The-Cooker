//
//  RecipeView.swift
//  The Cooker
//
//  Created by Nils on 6/7/24.
//

import SwiftUI

struct RecipeView: View {
    
    @ObservedObject var userData: UserData
    var currentRecipe: Recipe
    @State var showEditSheet = false
    var body: some View {
        
        VStack {
            RecipeNonListViews(currentRecipe: currentRecipe)
            RecipeListView(currentRecipe: currentRecipe, wasPressedIngredient: Array(repeating: false, count: currentRecipe.ingredients.count), wasPressedDirection: Array(repeating: false, count: currentRecipe.directions.count))
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    showEditSheet.toggle()
                }, label: {
                    Image(systemName: "pencil.circle")
                })
                .sheet(isPresented: $showEditSheet) {
                    EditView(userData: userData, currentRecipe: currentRecipe)
                }
            }
        }
    }
}

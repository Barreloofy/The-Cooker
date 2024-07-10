//
//  RecipeView.swift
//  The Cooker
//
//  Created by Nils on 6/7/24.
//

import SwiftUI

struct RecipeViewScene: View {
    
    @State private var pushView: Bool = false
    var nonRegularParent: Bool = false
    @EnvironmentObject private var recipeData: RecipeData
    var currentRecipe: Recipe
    @State private var showEditSheet = false
    var body: some View {
        ZStack {
            AppColor.background.ignoresSafeArea()
            VStack {
                RecipeNonListViews(currentRecipe: currentRecipe)
                RecipeListView(currentRecipe: currentRecipe)
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    recipeData.setFavoriteValue(currentRecipe)
                }, label: {
                    Image(systemName:"\(currentRecipe.isFavorite ? "star.fill" : "star")")
                })
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    showEditSheet.toggle()
                }, label: {
                    Image(systemName: "pencil.circle")
                })
                .sheet(isPresented: $showEditSheet) {
                    EditView(showEditSheet: $showEditSheet, currentRecipe: currentRecipe)
                }
            }
        }
    }
}

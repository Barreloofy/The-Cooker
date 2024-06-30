//
//  RecipeView.swift
//  The Cooker
//
//  Created by Nils on 6/7/24.
//

import SwiftUI

struct RecipeViewScene: View {
    
    @ObservedObject var userData: UserData
    var currentRecipe: Recipe
    @State var showEditSheet = false
    var body: some View {
        ZStack {
            Color(.secondarySystemBackground)
            VStack {
                RecipeNonListViews(currentRecipe: currentRecipe)
                RecipeListView(currentRecipe: currentRecipe)
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    showEditSheet.toggle()
                }, label: {
                    Image(systemName: "pencil.circle")
                })
                .sheet(isPresented: $showEditSheet) {
                    EditView(showEditSheet: $showEditSheet, userData: userData, currentRecipe: currentRecipe)
                }
            }
        }
    }
}

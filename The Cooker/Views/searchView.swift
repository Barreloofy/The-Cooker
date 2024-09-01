//
//  SearchView.swift
//  The Cooker
//
//  Created by Nils on 9/1/24.
//

import SwiftUI

struct SearchView: View {
    
    @EnvironmentObject private var recipeData: RecipeData
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            List(recipeData.recipeArray) { recipe in
                if searchText.isEmpty || recipe.contains(searchText) {
                    NavigationLink(destination: RecipeViewScene(currentRecipe: recipe)) {
                        ListRowView(recipe: recipe)
                    }
                }
            }
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
            .navigationTitle("Search")
        }
    }
}

#Preview() {
    SearchView()
        .environmentObject(RecipeData())
}

//
//  TabBarView.swift
//  The Cooker
//
//  Created by Nils on 7/8/24.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            RecipeCategoryScene()
                .tabItem {
                    Label("Recipes", systemImage: "pencil")
                }
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            FavoriteView()
                .tabItem {
                    Label("Favorites", systemImage: "star.fill")
                }
        }
    }
}

#Preview {
    TabBarView()
        .environmentObject(RecipeData())
}

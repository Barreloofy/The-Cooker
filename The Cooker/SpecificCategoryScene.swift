//
//  ContentView.swift
//  The Cooker
//
//  Created by Nils on 6/6/24.
//

import SwiftUI

struct ContentView: View {
    private func RecipesSorter(_ source: [Recipe] = Recipe.testRecipes) -> [Recipe] {
        var sortedRecipes = [Recipe]()
        for recipe in source {
            if recipe.mainInformation.category == category{
                sortedRecipes.append(recipe)
            }
        }
        return sortedRecipes
    }
    var category: MainInformation.Category
    var body: some View {
        List {
            ForEach(RecipesSorter()) {curentRecipe in
              NavigationLink(destination: RecipeView(currentRecipe: curentRecipe)) {
                Text(curentRecipe.mainInformation.name)
            }
          }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("\(category.rawValue)")
        
    }
}

#Preview {
    ContentView(category: .dinner)
}

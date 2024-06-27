//
//  ContentView.swift
//  The Cooker
//
//  Created by Nils on 6/6/24.
//

import SwiftUI

struct SpecificCategoryScene: View {
    private func RecipesSorter(_ source: [Recipe] = Recipe.testRecipes) -> [Recipe] {
        var sortedRecipes = [Recipe]()
        for recipe in source {
            if recipe.mainInformation.category == category {
                sortedRecipes.append(recipe)
            }
        }
        return sortedRecipes
    }
    @State private var showAlert = false
    @ObservedObject var userData: UserData
    var category: MainInformation.Category
    var body: some View {
        List {
            ForEach(RecipesSorter(userData.recipeArray)) {currentRecipe in
              NavigationLink(destination: RecipeViewScene(userData: userData, currentRecipe: currentRecipe)) {
                Text(currentRecipe.mainInformation.name)
                      .swipeActions(allowsFullSwipe: false) {
                          Button("Delete") {
                              showAlert.toggle()
                          }
                          .tint(.red)
                      }
                      .alert(isPresented: $showAlert) {
                          Alert(title: Text("Delete Item"),
                                message: Text("Are you sure you want to delete this item?"),
                                primaryButton: .destructive(Text("Delete")) {
                              userData.removeRecipe(currentRecipe)
                                },
                                secondaryButton: .cancel())
                      }
            }
          }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("\(category.rawValue)")
    }
}

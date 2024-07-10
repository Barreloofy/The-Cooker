//
//  UserData.swift
//  The Cooker
//
//  Created by Nils on 6/17/24.
//

import Foundation
import SwiftUI

class RecipeData: ObservableObject {
    @Published private(set) var recipeArray = Recipe.testRecipes
    @Published var showOptionalSteps: Bool = false
    
    func recipeSorter(_ category: MainInformation.Category) -> [Recipe] {
        var filteredRecipes = [Recipe]()
        for recipe in recipeArray {
            if recipe.mainInformation.category == category {
                filteredRecipes.append(recipe)
            }
        }
        return filteredRecipes
    }
    
    func addRecipe(_ recipe: Recipe) {
        recipeArray.append(recipe)
    }
    func removeRecipe(_ recipe: Recipe) {
        recipeArray.removeAll(where: {$0.id == recipe.id})
    }
    func findRecipeIndex(_ recipe: Recipe) -> Int? {
        return recipeArray.firstIndex {$0.id == recipe.id }
    }
    func saveModifications(_ recipe: Recipe) {
        guard let recipePosition = findRecipeIndex(recipe) else {return}
        recipeArray[recipePosition] = recipe
    }
    func setFavoriteValue(_ recipe: Recipe) {
        var recipe = recipe
        if recipe.isFavorite {
            recipe.isFavorite = false
        } else {
            recipe.isFavorite = true
        }
        saveModifications(recipe)
    }
}

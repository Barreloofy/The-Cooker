//
//  UserData.swift
//  The Cooker
//
//  Created by Nils on 6/17/24.
//

import Foundation
import SwiftUI

class UserData: ObservableObject {
    @Published private(set) var recipeArray = Recipe.testRecipes
    static let mainColor = Color(.secondarySystemBackground)
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
}

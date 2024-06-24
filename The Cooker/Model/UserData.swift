//
//  UserData.swift
//  The Cooker
//
//  Created by Nils on 6/17/24.
//

import Foundation


class UserData: ObservableObject {
    @Published private(set) var recipeArray = Recipe.testRecipes
    
    func addRecipe(_ recipe: Recipe) {
        recipeArray.append(recipe)
    }
    func removeRecipe(_ recipe: Recipe) {
        recipeArray.removeAll(where: {$0.id == recipe.id})
    }
}

//
//  UserData.swift
//  The Cooker
//
//  Created by Nils on 6/17/24.
//

import Foundation


class UserData: ObservableObject {
    @Published private var recipeArray = Recipe.testRecipes
    
    func addRecipe(_ mainInformation: MainInformation,_ Ingredients: [Ingredient],_ Directions: [Direction]) {
        recipeArray.append(Recipe(mainInformation: mainInformation, ingredients: Ingredients, directions: Directions))
    }
}

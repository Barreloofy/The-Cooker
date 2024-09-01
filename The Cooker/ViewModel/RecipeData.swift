//
//  UserData.swift
//  The Cooker
//
//  Created by Nils on 6/17/24.
//

import Foundation
import SwiftUI
import OSLog

class RecipeData: ObservableObject {
    @Published private(set) var recipeArray = Recipe.testRecipes {
        didSet {
            save()
        }
    }
    @Published var showOptionalSteps: Bool = false
    
    init() {
        showOptionalSteps = UserDefaults.standard.bool(forKey: "showOptionalSteps")
    }
    
    func toggleOptionalSteps() {
            UserDefaults.standard.set(showOptionalSteps, forKey: "showOptionalSteps")
        }
    
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
        guard let recipePosition = findRecipeIndex(recipe) else { return }
        recipeArray[recipePosition] = recipe
    }
    func setFavorite(_ recipe: Recipe) {
        var recipe = recipe
        if recipe.isFavorite {
            recipe.isFavorite = false
        } else {
            recipe.isFavorite = true
        }
        saveModifications(recipe)
    }
}


extension RecipeData {
    
    private var recipeFileUrl: URL {
        get {
            do {
                let documentsDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                return documentsDirectory.appendingPathComponent("recipeData", conformingTo: .json)
            }
            catch {
                fatalError("An error occurred while getting the url: \(error)")
            }
        }
    }
    func save() {
        do {
            let data = try JSONEncoder().encode(recipeArray)
            try data.write(to: recipeFileUrl)
        } catch {
            Logger().error("\(error)")
        }
    }
    
    func load() {
        guard FileManager.default.isReadableFile(atPath: recipeFileUrl.path) else { return }
        guard let data = try? Data(contentsOf: recipeFileUrl) else { return }
        do {
            recipeArray = try JSONDecoder().decode([Recipe].self, from: data)
        }
        catch {
            Logger().error("\(error)")
        }
    }
    func decodeImage(_ imageData: Data?) -> UIImage? {
        guard let data = imageData else { return nil }
        return UIImage(data: data)
    }
}

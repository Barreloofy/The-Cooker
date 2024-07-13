//
//  UserData.swift
//  The Cooker
//
//  Created by Nils on 6/17/24.
//

import Foundation
import SwiftUI

class RecipeData: ObservableObject {
    @Published private(set) var recipeArray = Recipe.testRecipes {
        didSet {
             try! save()
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


extension RecipeData {
    
    internal enum FileManagerError: Error {
        case saveFailed
        case loadRetrivingFailed
        case decodeFailed
        case imageConversionFailed
    }
    
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
    func save() throws {
        let data = try JSONEncoder().encode(recipeArray)
        try data.write(to: recipeFileUrl)
    }
    
    func load() throws {
        guard FileManager.default.isReadableFile(atPath: recipeFileUrl.path) else { return }
        guard let data = try? Data(contentsOf: recipeFileUrl) else {
            throw FileManagerError.loadRetrivingFailed
        }
        do {
            recipeArray = try JSONDecoder().decode([Recipe].self, from: data)
        }
        catch {
            throw FileManagerError.decodeFailed
        }
    }
    func decodeImage(_ imageData: Data?) throws -> UIImage {
        guard let data = imageData else {
            throw FileManagerError.decodeFailed
        }
        guard let image = UIImage(data: data) else {
            throw FileManagerError.imageConversionFailed
        }
        return image
    }
}

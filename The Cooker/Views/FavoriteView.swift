//
//  FavoriteView.swift
//  The Cooker
//
//  Created by Nils on 7/8/24.
//

import SwiftUI

struct FavoriteView: View {
    
    @EnvironmentObject private var recipeData: RecipeData
    var body: some View {
        NavigationStack {
        List {
            ForEach(isFavorite) {favorite in
                NavigationLink(destination: RecipeViewScene(currentRecipe: favorite)) {
                    Text(favorite.mainInformation.name)
                }
            }
        }
      }
    }
}

#Preview {
    FavoriteView()
        .environmentObject(RecipeData())
}


extension FavoriteView {
    private var isFavorite: [Recipe] {
        return recipeData.recipeArray.filter {$0.isFavorite }
    }
}

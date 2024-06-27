//
//  RecipeNonListViews.swift
//  The Cooker
//
//  Created by Nils on 6/15/24.
//

import SwiftUI

struct RecipeNonListViews: View {
    var currentRecipe: Recipe
    var body: some View {
        if let recipeImage = currentRecipe.customImage {
            Image(uiImage: recipeImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width, height: 200)
                .clipped()
                .padding(.top, -150)
        } else {
            Image(currentRecipe.mainInformation.name)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width, height: 200)
                .clipped()
                .padding(.top, -150)
        }
        Text(currentRecipe.mainInformation.name)
            .font(.title)
            .bold()
        
        Text(currentRecipe.mainInformation.description)
            .font(.subheadline)
            .bold()
            .padding(5)
            .multilineTextAlignment(.center
            )
        HStack {
            Text("Author:")
            Text(currentRecipe.mainInformation.author)
        }
        .font(.subheadline)
        .bold()
        .multilineTextAlignment(.leading)
        .padding(.top, 10)
        .padding(.leading, -180)
    }
}

//
//  RecipeNonListViews.swift
//  The Cooker
//
//  Created by Nils on 6/15/24.
//

import SwiftUI

struct RecipeNonListViews: View {
    
    @EnvironmentObject private var recipeData: RecipeData
    var currentRecipe: Recipe
    var body: some View {
        if currentRecipe.customImage != nil {
            if let image = recipeData.decodeImage(currentRecipe.customImage) {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .opacity(0.80)
                    .frame(width: UIScreen.main.bounds.width, height: 200)
                    .clipped()
                    .padding(.top, -150)
              }
            } else {
                Image(currentRecipe.mainInformation.name)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .opacity(0.80)
                    .frame(width: UIScreen.main.bounds.width, height: 200)
                    .clipped()
                    .padding(.top, -150)
            }
            Text(currentRecipe.mainInformation.name)
                .font(.title)
                .bold()
                .underline()
            
            Text(currentRecipe.mainInformation.description)
                .font(.subheadline)
                .bold()
                .padding(5)
                .multilineTextAlignment(.center
                )
            HStack {
                Text("Author:")
                Text("\(currentRecipe.mainInformation.author.isEmpty ? "No Author" : currentRecipe.mainInformation.author)")
            }
            .font(.subheadline)
            .bold()
            .multilineTextAlignment(.leading)
            .padding(.top, 10)
            .padding(.leading, -180)
        }
    }


//
//  RecipeView.swift
//  The Cooker
//
//  Created by Nils on 6/7/24.
//

import SwiftUI

struct RecipeView: View {
    var currentRecipe: Recipe
    var body: some View {
        
        VStack {
            Image(currentRecipe.mainInformation.name)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width, height: 200)
                .clipped()
                .padding(.top, -150)
            
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
            List {
                Section(header: Text("ingredients")){
                    
                    ForEach(currentRecipe.ingredients) {ingredient in
                        Label("\(ingredient.description)", systemImage: "circle")
                    }
                
                }
                Section(header: Text("Directions")){
                    ForEach(currentRecipe.directions) {direction in
                        Label("\(direction.description)", systemImage: "circle")
                            .padding(5)
                    }
                }
            }
            .listStyle(PlainListStyle())
        }
    
    }
}

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
        @State var wasPressedDirection = Array(repeating: false, count: currentRecipe.directions.count)
        @State var wasPressedIngredient = Array(repeating: false, count: currentRecipe.ingredients.count)
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
                    
                    ForEach(currentRecipe.ingredients.indices) {ingredientIndex in
                        Button(action: {
                            wasPressedIngredient[ingredientIndex].toggle()
                        }, label: {
                            if wasPressedIngredient[ingredientIndex] {
                             Label("\(currentRecipe.ingredients[ingredientIndex].description)", systemImage: "circle.circle.fill").opacity(0.5).foregroundColor(.gray)
                            } else {
                                Label("\(currentRecipe.ingredients[ingredientIndex].description)", systemImage: "circle")
                            }
                        })
                    }
                
                }
                Section(header: Text("Directions")){
                    ForEach(currentRecipe.directions.indices) {directionIndx in
                        Button(action: {
                            wasPressedDirection[directionIndx].toggle()
                        }, label: {
                            if wasPressedDirection[directionIndx] {
                                Label("\(currentRecipe.directions[directionIndx].description)", systemImage: "circle.circle.fill").opacity(0.5).foregroundColor(.gray)
                                    .padding(5)
                            } else {
                                Label("\(currentRecipe.directions[directionIndx].description)", systemImage: "circle")
                            }
                        })
                    }
                }
            }
            .listStyle(PlainListStyle())
        }
    
    }
}

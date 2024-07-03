//
//  CategoryForEach.swift
//  The Cooker
//
//  Created by Nils on 6/11/24.
//

import SwiftUI

struct CategoryForEachScene: View {
    
    @EnvironmentObject private var recipeData: RecipeData
    var body: some View {
        ForEach(MainInformation.Category.allCases, id: \.self) {category in
            NavigationLink(destination: SpecificCategoryScene(category: category)) {
            ZStack {
                Image(category.rawValue)
                    .resizable()
                    .scaledToFit()
                    .opacity(0.85)
                Text(category.rawValue)
                    .foregroundColor(.black)
                    .font(.subheadline)
                    .bold()
                    .padding(1)
                    .overlay(
                        Rectangle().stroke(Color.black, lineWidth: 2)
                    )
                Rectangle().stroke(Color.black, lineWidth: 5)}
           }
        }
    }
}

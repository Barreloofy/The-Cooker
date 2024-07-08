//
//  searchView.swift
//  The Cooker
//
//  Created by Nils on 7/8/24.
//

import SwiftUI

struct searchView: View {
    
    @EnvironmentObject private var recipeData: RecipeData
    @State private var input: String = ""
    var body: some View {
        NavigationStack {
        List {
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Search", text: $input)
                if !input.isEmpty {
                    Button(action: {
                        input = ""
                    }, label: {
                        Image(systemName: "x.circle.fill")
                    })
                    .foregroundStyle(.gray)
                }
            }
            ForEach(result) {foundRecipe in
                NavigationLink(destination: RecipeViewScene(currentRecipe: foundRecipe)) {
                    Text(foundRecipe.mainInformation.name)
                }
            }
        }
      }
    }
}

#Preview {
    searchView()
        .environmentObject(RecipeData())
}

extension searchView {
    private var result: [Recipe] {
        return recipeData.recipeArray.filter {$0.mainInformation.name == input}
    }
}

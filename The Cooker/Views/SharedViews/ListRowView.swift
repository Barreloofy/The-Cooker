//
//  ListRowView.swift
//  The Cooker
//
//  Created by Nils on 7/10/24.
//

import SwiftUI

struct ListRowView: View {
    
    var recipe: Recipe
    var body: some View {
        HStack {
            if let image = recipe.customImage {
                Image(uiImage: image)
                    .resizable()
                    .frame(width: 40,height: 40)
                    .clipShape(Circle())
            } else {
                Image("\(recipe.mainInformation.name)")
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 50,height: 50)
            }
            Text(recipe.mainInformation.name)
          }
        }
    }


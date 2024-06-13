//
//  RecipeCategory.swift
//  The Cooker
//
//  Created by Nils on 6/9/24.
//

import SwiftUI

struct RecipeCategory: View {
    
    var body: some View {
        NavigationView {
            LazyVGrid(columns: Array(repeating: .init(.flexible()), count: 2)) {
                CategoryForEach()
            }
            .padding(10)
            .frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .top)
            .navigationTitle("Category")
            
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    RecipeCategory()
}

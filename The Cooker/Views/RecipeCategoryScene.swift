//
//  RecipeCategory.swift
//  The Cooker
//
//  Created by Nils on 6/9/24.
//

import SwiftUI

struct RecipeCategoryScene: View {
    
    @State private var isPresenting: Bool = false
    var body: some View {
        NavigationStack {
            ZStack {
                AppColor.background.ignoresSafeArea()
            LazyVGrid(columns: Array(repeating: .init(.flexible()), count: 2)) {
                CategoryForEachScene()
            }
            .padding(10)
            .frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .top)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text("Category")
                        .font(.largeTitle)
                        .bold()
                        .padding(.bottom, -1)
                        .padding(.leading, -10)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        isPresenting.toggle()
                    }, label: {
                        Image(systemName: "plus")
                    })
                    .foregroundStyle(.black)
                    .padding(.bottom, -3)
                }
            }
        }
      }
        .navigationBarBackButtonHidden(true)
        .sheet(isPresented: $isPresenting) {
            AddRecipeView()
        }
    }
}

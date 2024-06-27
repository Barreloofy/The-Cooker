//
//  RecipeCategory.swift
//  The Cooker
//
//  Created by Nils on 6/9/24.
//

import SwiftUI

struct RecipeCategory: View {
    @ObservedObject var userData = UserData()
    @State private var isPresenting: Bool = false
    var body: some View {
        NavigationView {
            LazyVGrid(columns: Array(repeating: .init(.flexible()), count: 2)) {
                CategoryForEach(userData: userData)
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
        .navigationBarBackButtonHidden(true)
        .sheet(isPresented: $isPresenting) {
            AddRecipeView(userData: userData)
        }
    }
}

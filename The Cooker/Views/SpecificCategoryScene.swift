//
//  ContentView.swift
//  The Cooker
//
//  Created by Nils on 6/6/24.
//

import SwiftUI

struct SpecificCategoryScene: View {
    
    @EnvironmentObject private var recipeData: RecipeData
    @State private var showAlert = false
    var category: MainInformation.Category
    var body: some View {
        List {
            ForEach(recipeData.recipeSorter(category)) {currentRecipe in
                NavigationLink(destination: RecipeViewScene(currentRecipe: currentRecipe)) {
                  ListRowView(recipe: currentRecipe)
                      .swipeActions(allowsFullSwipe: false) {
                          Button("Delete") {
                              showAlert.toggle()
                          }
                          .tint(.red)
                      }
                      .alert(isPresented: $showAlert) {
                          Alert(title: Text("Delete Item"),
                                message: Text("Are you sure you want to delete this item?"),
                                primaryButton: .destructive(Text("Delete")) {
                              recipeData.removeRecipe(currentRecipe)
                                },
                                secondaryButton: .cancel())
                      }
            }
          }
            .listRowBackground(AppColor.background)
        }
        .scrollContentBackground(.hidden)
        .background(AppColor.background)
        .listStyle(PlainListStyle())
        .navigationTitle("\(category.rawValue)")
    }
}

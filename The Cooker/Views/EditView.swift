//
//  EditView.swift
//  The Cooker
//
//  Created by Nils on 6/24/24.
//

import SwiftUI

struct EditView: View {
    
    @Binding var showEditSheet: Bool
    @ObservedObject var userData: UserData
    @State var currentRecipe: Recipe
    var body: some View {
        NavigationView {
        Form {
            Section(header: Text("Main Information")) {
                if currentRecipe.mainInformation.name != "" {
                    TextField("\(currentRecipe.mainInformation.name)", text: $currentRecipe.mainInformation.name)
                } else {
                    TextField("Recipe Name", text: $currentRecipe.mainInformation.name)
                }
                if currentRecipe.mainInformation.author != "" {
                    TextField("\(currentRecipe.mainInformation.author)", text: $currentRecipe.mainInformation.author)
                } else {
                    TextField("Author", text: $currentRecipe.mainInformation.author)
                }
                ZStack {
                    TextEditor(text: $currentRecipe.mainInformation.description)
                    Text(currentRecipe.mainInformation.description)
                        .opacity(0)
                }
                .padding(.leading, -2)
            }
            Section(header: Text("Ingredients")) {
                
                ForEach(currentRecipe.ingredients.indices, id: \.self) {index in
                    var combinedText: String {
                        return "\(currentRecipe.ingredients[index].quantity) \(currentRecipe.ingredients[index].unit.rawValue)"
                    }
                    
                    Text("Ingredient: \(index+1)").font(.subheadline).bold()
                    HStack {
                        Text("Recipe Name: ")
                        TextField(("\(currentRecipe.ingredients[index].name)"), text: $currentRecipe.ingredients[index].name)
                    }
                        Picker("Unit", selection: $currentRecipe.ingredients[index].unit) {
                            Text("Cups").tag(Ingredient.Unit.cups)
                            Text("Gram").tag(Ingredient.Unit.g)
                            Text("Ounces").tag(Ingredient.Unit.oz)
                            Text("Tablespoons").tag(Ingredient.Unit.tbs)
                            Text("Teaspoons").tag(Ingredient.Unit.tsp)
                            Text("No Unit").tag(Ingredient.Unit.none)
                        }
                        @State var unitNotNone = currentRecipe.ingredients[index].unit != .none
                        if unitNotNone {
                            HStack {
                                Text("Quantity: ")
                                ZStack {
                                TextField("Quantity", value: $currentRecipe.ingredients[index].quantity, format: .number)
                                    .keyboardType(.numbersAndPunctuation)
                                    //.opacity(0)
                                Text(combinedText)
                              }
                            }
                        }
                }
                Button(action: {
                    currentRecipe.ingredients.append(Ingredient())
                }, label: {
                    Image(systemName: "plus")
                })
            }
            Section(header: Text("Directions")) {
                ForEach(currentRecipe.directions.indices, id: \.self) {index in
                    Text("Step: \(index+1)").font(.subheadline).bold()
                    ZStack {
                        TextEditor(text: $currentRecipe.directions[index].description)
                        Text(currentRecipe.directions[index].description)
                            .opacity(0)
                    }
                    Toggle("Optional Step?", isOn: $currentRecipe.directions[index].isOptional)
                }
                Button(action: {
                    currentRecipe.directions.append(Direction())
                },
                   label: {
                    Image(systemName: "plus")
                })
            }
        }
        .tint(.black)
        .toolbar {
            ToolbarItem {
                Button("Save", action: {
                    userData.saveModifications(currentRecipe)
                    showEditSheet.toggle()
                })
            }
        }
    }
  }
}

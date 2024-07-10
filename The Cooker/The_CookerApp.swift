//
//  The_CookerApp.swift
//  The Cooker
//
//  Created by Nils on 6/6/24.
//

import SwiftUI

@main
    struct The_CookerApp: App {
        
    @StateObject private var recipeData = RecipeData()
    var body: some Scene {
        WindowGroup {
            TabBarView()
                .environmentObject(recipeData)
        }
    }
}

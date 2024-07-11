//
//  SettingsView.swift
//  The Cooker
//
//  Created by Nils on 7/7/24.
//

import SwiftUI

struct SettingsView: View {
    
    @EnvironmentObject private var recipeData: RecipeData
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        NavigationStack {
            List {
                Toggle("Hide optional steps", isOn: $recipeData.showOptionalSteps)
                    .onChange(of: recipeData.showOptionalSteps) {
                        recipeData.toggleOptionalSteps()
                    }
            }
            .scrollContentBackground(.hidden)
            .background(AppColor.background)
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
    }
}

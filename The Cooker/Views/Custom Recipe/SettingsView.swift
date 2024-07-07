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
                Toggle("Dark Mode", isOn: .constant(true))
                Toggle("Hide optional steps", isOn: $recipeData.showOptionalSteps)
            }
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

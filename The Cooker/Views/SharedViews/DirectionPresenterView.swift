//
//  DirectionPresenterView.swift
//  The Cooker
//
//  Created by Nils on 7/1/24.
//

import SwiftUI

struct DirectionPresenterView: View {
    
    @Binding var direction: Direction
    var body: some View {
        NavigationStack {
            Form {
                ZStack {
                    TextEditor(text: $direction.description)
                    Text("                                                                                     \(direction.description)").opacity(0)
                }
                Toggle("Optional Step?", isOn: $direction.isOptional)
            }
        }
        .navigationTitle("Direction")
        .navigationBarBackButtonHidden(true)
        .toolbar {
            DoneButton()
        }
    }
}

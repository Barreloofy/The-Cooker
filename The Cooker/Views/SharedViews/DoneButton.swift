//
//  DoneButton.swift
//  The Cooker
//
//  Created by Nils on 7/4/24.
//

import SwiftUI

struct DoneButton: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
            Button(action: {dismiss()}, label: {
                Text("Done")
        })
    }
}

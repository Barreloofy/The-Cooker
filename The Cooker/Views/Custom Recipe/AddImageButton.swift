//
//  AddImageButton.swift
//  The Cooker
//
//  Created by Nils on 6/22/24.
//

import SwiftUI
import PhotosUI

struct AddImageButton: View {
    @State private var SelectedImage: PhotosPickerItem?
    @Binding var customImage: Data?
    
    var body: some View {
        PhotosPicker(selection: $SelectedImage, matching: .images) {
            Image(systemName: "plus")
        }
        .onChange(of: SelectedImage) {
            Task {
            if let data = try? await SelectedImage?.loadTransferable(type: Data.self) {
                customImage = data
            }
          }
        }
    }
}

//
//  AddImageButton.swift
//  The Cooker
//
//  Created by Nils on 6/22/24.
//

import SwiftUI
import PhotosUI

struct AddImageButton: View {
    @EnvironmentObject private var recipeData: RecipeData
    @State private var SelectedImage: PhotosPickerItem?
    @Binding var customImage: Data?
    
    var body: some View {
        PhotosPicker(selection: $SelectedImage, matching: .images) {
            //recipe.customImage == nil ? Image(systemName: "plus") : Image(systemName: "photo.on.rectangle.angled")
            if customImage != nil {
                Image(uiImage: recipeData.decodeImage(customImage)!)
                    .resizable()
                    .frame(width: 40,height: 40)
                    .clipShape(Circle())
            } else {
                Image(systemName: "plus")
            }
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

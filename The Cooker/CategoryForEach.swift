//
//  CategoryForEach.swift
//  The Cooker
//
//  Created by Nils on 6/11/24.
//

import SwiftUI

struct CategoryForEach: View {
    
    var body: some View {
        ForEach(MainInformation.Category.allCases, id: \.self) {category in
            NavigationLink(destination: ContentView(category: category)) {
            ZStack {
                Image(category.rawValue)
                    .resizable()
                    .scaledToFit()
                    .opacity(0.85)
                Text(category.rawValue)
                    .foregroundColor(.black)
                    .font(.subheadline)
                    .bold()
                    .padding(1)
                    .overlay(
                        Rectangle().stroke(Color.black, lineWidth: 2)
                    )
                Rectangle().stroke(Color.black, lineWidth: 5)}
           }
        }
    }
}


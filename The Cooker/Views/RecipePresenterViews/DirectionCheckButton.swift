//
//  DirectionCheckButton.swift
//  The Cooker
//
//  Created by Nils on 6/27/24.
//

import SwiftUI

struct DirectionCheckButton: View {
    
    var direction: Direction
    @State var wasPressedDirection = false
    var body: some View {
        
        Button(action: {
            wasPressedDirection.toggle()
        }, label: {
            if wasPressedDirection {
                if direction.isOptional {
                    Label("(Optional) \(direction.description)", systemImage: "circle.circle.fill").opacity(0.5).foregroundColor(.gray)
                        .padding(5)
                } else {
                    Label("\(direction.description)", systemImage: "circle.circle.fill").opacity(0.5).foregroundColor(.gray)
                        .padding(5)
                }
            } else {
                if direction.isOptional {
                    Label("(Optional) \(direction.description)", systemImage: "circle")
                } else {
                    Label("\(direction.description)", systemImage: "circle")
                }
            }
        })
    }
}

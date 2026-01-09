//
//  IconButton.swift
//  Feeder
//
//  Created by Nick Goncharenko on 24.12.2025.
//

import SwiftUI

struct IconButton: View {
    
    let icon: Image
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            icon
                .resizable()
                .scaledToFit()
                .frame(height: 26)
                .foregroundStyle(Res.color.coreWhite)
        }
        .frame(width: 44, height: 44, alignment: .leading)
    }
}

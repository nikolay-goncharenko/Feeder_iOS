//
//  TextButton.swift
//  Feeder
//
//  Created by Nick Goncharenko on 24.12.2025.
//

import SwiftUI

struct TextButton: View {
    
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(Res.font.sfProTextRegular(16))
                .foregroundStyle(Res.color.coreWhite)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.vertical, 8)
        }
        .background(Res.color.coreBlack)
    }
}

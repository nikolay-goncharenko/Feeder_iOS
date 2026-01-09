//
//  HybridButton.swift
//  Feeder
//
//  Created by Nick Goncharenko on 24.12.2025.
//

import SwiftUI

struct HybridButton: View {
    
    struct Style {
        var tintColor: Color
    }
    
    let icon: Image
    let title: String
    let style: Style
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(alignment: .center, spacing: 10) {
                icon
                    .resizable()
                    .scaledToFit()
                    .frame(height: 14)
                
                Text(title)
                    .font(Res.font.sfProTextRegular(18))
                    .frame(alignment: .leading)
                    .padding(.vertical, 8)
            }
        }
        .foregroundStyle(style.tintColor)
    }
}

extension HybridButton.Style {
    static let light = Self(
        tintColor: Res.color.coreWhite
    )
    
    static let dark = Self(
        tintColor: Res.color.coreBlack
    )
}

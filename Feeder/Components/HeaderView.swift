//
//  HeaderView.swift
//  Feeder
//
//  Created by Nick Goncharenko on 14.12.2025.
//

import SwiftUI

struct HeaderView: View {
    
    let title: String
    
    var body: some View {
        ZStack {
            Res.color.systemBlack
            Text(title)
                .foregroundColor(Res.color.systemWhite)
                .font(Res.font.sfProTextBold(20))
        }
        .frame(height: 60)
    }
}

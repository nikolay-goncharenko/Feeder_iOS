//
//  NavigationHeaderView.swift
//  Feeder
//
//  Created by Nick Goncharenko on 14.12.2025.
//

import SwiftUI

struct NavigationHeaderView<AnyButton: View>: View {
    let button: AnyButton
    let title: String
    let logoImage: Image?
    
    init(button: AnyButton, title: String, logo: Image? = nil) {
        self.button = button
        self.title = title
        self.logoImage = logo
    }
    
    var body: some View {
        ZStack {
            Color(R.color.coreBlack)
            HStack(spacing: 10) {
                button
                
                Spacer()
                
                if let logoImage {
                    logoImage
                        .resizable()
                        .scaledToFit()
                        .frame(height: 20, alignment: .trailing)
                }
            }
            .padding(.horizontal, 20)
            
            ZStack(alignment: .center) {
                Text(title)
                    .foregroundStyle(Res.color.coreWhite)
                    .font(Res.font.sfProTextBold(20))
                    .frame(maxWidth: .infinity)
                    .lineLimit(1)
            }
            .padding(.horizontal, 64)
        }
        .frame(height: 60)
    }
}

#Preview {
    NavigationHeaderView(button: IconButton(icon: Res.image.getBackIcon, action: {
        print("")
    }), title: "Some Title")
}

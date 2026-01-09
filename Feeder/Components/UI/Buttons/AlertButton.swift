//
//  AlertButton.swift
//  Feeder
//
//  Created by Nick Goncharenko on 19.12.2025.
//

import SwiftUI

struct AlertButton: ButtonView {
    @Environment(\.buttonValues) private var env
    
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(env.titleFont)
                .foregroundStyle(env.titleColor)
                .frame(maxWidth: .infinity)
                .frame(height: env.height)
        }
        .buttonStyle(
            AlertButtonStyle(
                blurStyle: env.blurStyle
            )
        )
        .clipShape(
            RoundedRectangle(cornerRadius: env.cornerRadius)
        )
        .clipped()
    }
}

struct AlertButtonStyle: ButtonStyle {
    let blurStyle: UIBlurEffect.Style
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? 0.6 : 1.0)
        
            .background {
                BlurView(style: blurStyle)
                Color(R.color.fadedGraphite)
                    .opacity(configuration.isPressed ? 1.0 : 0.0)
            }
        
            .animation(
                .easeInOut(duration: configuration.isPressed ? 0.05 : 0.25),
                value: configuration.isPressed
            )
    }
}

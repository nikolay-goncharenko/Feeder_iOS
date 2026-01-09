//
//  CenterActionAlert.swift
//  Feeder
//
//  Created by Nick Goncharenko on 03.01.2026.
//

import SwiftUI

struct CenterActionAlert: View {
    @State private var isAnimating = false
    
    let title: String
    let description: String
    let action: () -> Void
    
    var body: some View {
        ZStack {
            // Dimmed View
            Color(R.color.coreBlack).opacity(0.35)
                .ignoresSafeArea()
                .opacity(isAnimating ? 1 : 0)
            
            VStack(spacing: 0) {
                // Title + Description
                VStack(spacing: 4) {
                    Text(title)
                        .font(Res.font.sfProTextSemibold(18))
                        .foregroundStyle(Res.color.coreBlack)
                    
                    Text(description)
                        .font(Res.font.sfProTextRegular(14))
                        .foregroundStyle(Res.color.coreBlack)
                        .multilineTextAlignment(.center)
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 19)
                
                // Divider
                Rectangle()
                    .fill(Res.color.coreBlack.opacity(0.15))
                    .frame(height: 0.5)
                
                AlertButton(title: "OK", action: {
                    performCloseAnimation(completion: action)
                })
                .titleFont(Res.font.sfProTextRegular(18))
                .titleColor(Res.color.coreBlue)
            }
            
            // BG alert
            .background(Res.color.softPearl)
            
            .background(.ultraThinMaterial)
            .environment(\.colorScheme, .light)
            
            .cornerRadius(14)
            .padding(.horizontal, 52)
            .scaleEffect(isAnimating ? 1.0 : 0.8)
            .opacity(isAnimating ? 1.0 : 0.0)
        }
        .onAppear {
            withAnimation(.spring(response: 0.35, dampingFraction: 0.85, blendDuration: 0.5)) {
                isAnimating = true
            }
        }
    }
    
    private func performCloseAnimation(completion: @escaping () -> Void) {
        withAnimation(.easeInOut(duration: 0.22)) {
            isAnimating = false
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.22) {
            completion()
        }
    }
}

//
//  BottomActionSheet.swift
//  Feeder
//
//  Created by Nick Goncharenko on 03.01.2026.
//

import SwiftUI

struct BottomActionSheet: View {
    @State private var isShowing = false
    
    // MARK: - Properties
    let byDate: () -> Void
    let byRating: () -> Void
    let cancelAction: () -> Void
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // MARK: - Dimmed Background
            Color.black.opacity(0.35)
                .ignoresSafeArea()
                .opacity(isShowing ? 1 : 0)
                .onTapGesture {
                    performCloseAnimation(completion: cancelAction)
                }
            
            // MARK: - Primary Column
            VStack(spacing: 8) {
                // Buttons Group
                VStack(spacing: 0) {
                    
                    AlertButton(title: "By date", action: {
                        performCloseAnimation(completion: byDate)
                    })
                    .titleFont(Res.font.sfProTextRegular(20))
                    .titleColor(Res.color.coreBlue)
                    .style(.systemThickMaterial)
                    .height(60)
                    
                    // Divider
                    Rectangle()
                        .fill(Res.color.coreBlack.opacity(0.15))
                        .frame(height: 0.5)
                    
                    AlertButton(title: "By rating", action: {
                        performCloseAnimation(completion: byRating)
                    })
                    .titleFont(Res.font.sfProTextRegular(20))
                    .titleColor(Res.color.coreBlack)
                    .style(.systemThickMaterial)
                    .height(60)
                }
                .cornerRadius(14)
                .clipped()
                
                AlertButton(title: "Cancel", action: {
                    performCloseAnimation(completion: cancelAction)
                })
                .titleFont(Res.font.sfProTextSemibold(20))
                .titleColor(Res.color.coreBlue)
                .style(.systemThickMaterial)
                .corner(radius: 14)
                .height(56)
                
            }
            .padding(.horizontal, 8)
            .padding(.bottom, 8)
            // Appearing from bottom
            .offset(y: isShowing ? 0 : 400)
        }
        .onAppear {
            // Spring for Expand
            withAnimation(.spring(response: 0.35, dampingFraction: 0.85, blendDuration: 0.4)) {
                isShowing = true
            }
        }
    }
    
    // MARK: - Private Animations
    private func performCloseAnimation(completion: @escaping () -> Void) {
        withAnimation(.easeIn(duration: 0.22)) {
            isShowing = false
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.22) {
            completion()
        }
    }
}

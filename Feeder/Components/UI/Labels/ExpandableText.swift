//
//  ExpandableText.swift
//  Feeder
//
//  Created by Nick Goncharenko on 25.12.2025.
//

import SwiftUI

struct ExpandableText: View {
    @State private var isExpanded: Bool = false
    @State private var isTruncated: Bool = false
    private let backgroundColor: Color = Res.color.coreWhite
    
    let text: String
    
    init(_ text: String) {
        self.text = text
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(text)
                .font(Res.font.sfProTextRegular(16))
                .lineLimit(isExpanded ? nil : 2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .overlay(alignment: .bottomTrailing) {
                    if !isExpanded {
                        expandButton
                            .transition(.opacity.combined(with: .move(edge: .trailing)))
                    }
                }
        }
        .animation(.spring(response: 0.5, dampingFraction: 0.85), value: isExpanded)
        .onTapGesture {
            if isExpanded {
                isExpanded.toggle()
            }
        }
    }
    
    private var expandButton: some View {
        HStack(spacing: 0) {
            LinearGradient(
                gradient: Gradient(colors: [
                    backgroundColor.opacity(0.4),
                    backgroundColor.opacity(0.6),
                    backgroundColor.opacity(0.8),
                    backgroundColor.opacity(1.0)
                ]),
                startPoint: .leading,
                endPoint: .trailing
            )
            .frame(width: 40, height: 16)
            
            Color.white
                .frame(width: 20, height: 16)
            
            Button("...read more", action: {
                withAnimation(.spring()) {
                    isExpanded = true
                }
            })
            .font(Res.font.sfProTextSemibold(16))
            .foregroundStyle(Res.color.coreBlack)
            .background(backgroundColor)
            .padding(.trailing, 0)
        }
    }
}

//
//  ItemCell.swift
//  Feeder
//
//  Created by Nick Goncharenko on 19.12.2025.
//

import SwiftUI

struct ItemCell: View {
    let dto: FeedListDTO
    let action: () -> Void
    
    var body: some View {
        VStack(spacing: 16) {
            
            VStack(alignment: .leading, spacing: 8) {
                Text(dto.title)
                    .font(Res.font.sfProTextBold(18))
                    .foregroundStyle(Res.color.coreBlack)
                
                ExpandableText(dto.previewText)
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 20)
            
            TextButton(title: "Show in full", action: action)
            
            HStack {
                HStack(spacing: 8) {
                    Image(R.image.heartIcon)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 14)
                    
                    Text("\(dto.likesCount)")
                        .font(Res.font.sfProTextBold(14))
                }
                .colorMultiply(Res.color.coreBlack)
                
                Spacer()
                
                Text(dto.timestamp.toRelativeDate)
                    .font(Res.font.sfProTextRegular(14))
                    .foregroundStyle(Res.color.coreBlack)
                
            }
            .padding(.horizontal, 20)
        }
        .padding(.vertical, 16)
        .background(Res.color.coreWhite)
    }
}

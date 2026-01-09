//
//  Res.swift
//  Feeder
//
//  Created by Nick Goncharenko on 18.12.2025.
//

// MARK: - Global imports
@_exported import RswiftResources

// MARK: - Local imports
import SwiftUI

enum Res {
    
    @dynamicMemberLookup
    enum color {
        static subscript(
            dynamicMember keyPath: KeyPath<_R.color, RswiftResources.ColorResource>
        ) -> Color {
            let resouce = R.color[keyPath: keyPath]
            return Color(resouce)
        }
    }
    
    @dynamicMemberLookup
    enum image {
        static subscript(
            dynamicMember keyPath: KeyPath<_R.image, RswiftResources.ImageResource>
        ) -> Image {
            let resouce = R.image[keyPath: keyPath]
            return Image(resouce)
        }
    }
    
    @dynamicMemberLookup
    enum font {
        static subscript(
            dynamicMember keyPath: KeyPath<_R.font, RswiftResources.FontResource>
        ) -> (_ size: CGFloat) -> Font {
            return { size in
                let resouce = R.font[keyPath: keyPath]
                return Font(resouce.callAsFunction(size: size) ?? .systemFont(ofSize: size))
            }
        }
    }
}

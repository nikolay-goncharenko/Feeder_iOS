//
//  ButtonView+Extension.swift
//  Feeder
//
//  Created by Nick Goncharenko on 04.01.2026.
//

import SwiftUI

protocol ButtonView: View {}

extension ButtonView {
    
    private func update<Value>(
        _ keyPath: WritableKeyPath<ButtonViewValues, Value>,
        with newValue: Value
    ) -> some ButtonView {
        ModifiedButtonView(content: transformEnvironment(\.buttonValues) { values in
            values[keyPath: keyPath] = newValue
        })
    }
    
    func titleFont(_ font: Font) -> some ButtonView {
        update(\.titleFont, with: font)
    }
    
    func titleColor(_ color: Color) -> some ButtonView {
        update(\.titleColor, with: color)
    }
    
    func height(_ height: CGFloat) -> some ButtonView {
        update(\.height, with: height)
    }
    
    func style(_ style: UIBlurEffect.Style) -> some ButtonView {
        update(\.blurStyle, with: style)
    }
    
    func corner(radius: CGFloat) -> some ButtonView {
        update(\.cornerRadius, with: radius)
    }
}


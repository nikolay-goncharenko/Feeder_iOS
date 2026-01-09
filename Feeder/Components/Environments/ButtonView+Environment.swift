//
//  ButtonView+Environment.swift
//  Feeder
//
//  Created by Nick Goncharenko on 04.01.2026.
//

import SwiftUI

struct ButtonViewValues {
    var titleFont: Font
    var titleColor: Color
    var height: CGFloat
    var blurStyle: UIBlurEffect.Style
    var cornerRadius: CGFloat
    
    static let `default` = ButtonViewValues(
        titleFont: .body,
        titleColor: .primary,
        height: 44,
        blurStyle: .systemMaterial,
        cornerRadius: 0
    )
}

private struct ButtonViewKey: EnvironmentKey {
    static let defaultValue = ButtonViewValues.default
}

extension EnvironmentValues {
    var buttonValues: ButtonViewValues {
        get { self[ButtonViewKey.self] }
        set { self[ButtonViewKey.self] = newValue }
    }
}

struct ModifiedButtonView<Content: View>: ButtonView {
    let content: Content
    var body: some View { content }
}

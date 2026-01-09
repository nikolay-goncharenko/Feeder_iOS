//
//  OverlayPresentationStyle.swift
//  Feeder
//
//  Created by Nick Goncharenko on 08.01.2026.
//

import UIKit

enum OverlayPresentationStyle {
    case overCurrentContext
    case fullScreen
    case automatic
}

extension OverlayPresentationStyle {
    var uiKitStyle: UIModalPresentationStyle {
        switch self {
        case .overCurrentContext:
            return .overCurrentContext
        case .fullScreen:
            return .fullScreen
        case .automatic:
            return .automatic
        }
    }
}

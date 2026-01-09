//
//  BaseViewController.swift
//  Feeder
//
//  Created by Nick Goncharenko on 14.12.2025.
//

import SwiftUI

final class BaseViewController: UIHostingController<AnyView> {
    
    enum StatusBarStyle {
        case `default`
        case light
        case dark
    }
    
    enum BackgroundStyle {
        case `default`
        case clear
    }
    
    var statusbarStyle: StatusBarStyle = .default {
        didSet {
            setNeedsStatusBarAppearanceUpdate()
        }
    }
    
    var backgroundStyle: BackgroundStyle = .default {
        didSet {
            updateBackgroundStyle()
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        switch statusbarStyle {
        case .default: .default
        case .light: .lightContent
        case .dark: .darkContent
        }
    }
    
    convenience init<V: View>(rootView: V) {
        self.init(rootView: AnyView(rootView))
    }
    
    private func updateBackgroundStyle() {
        switch backgroundStyle {
        case .default:
            view.backgroundColor = nil
        case .clear:
            view.backgroundColor = .clear
        }
    }
}

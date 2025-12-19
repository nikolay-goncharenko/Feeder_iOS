//
//  BaseViewController.swift
//  Feeder
//
//  Created by Nick Goncharenko on 14.12.2025.
//

import SwiftUI

final class BaseViewController: UIHostingController<AnyView> {
    
    enum StatusBarStyle {
        case byDefault
        case light
        case dark
    }
    
    var statusbarStyle: StatusBarStyle = .byDefault {
        didSet {
            setNeedsStatusBarAppearanceUpdate()
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        switch statusbarStyle {
        case .byDefault: .default
        case .light: .lightContent
        case .dark: .darkContent
        }
    }
    
    convenience init<V: View>(rootView: V) {
        self.init(rootView: AnyView(rootView))
    }
}

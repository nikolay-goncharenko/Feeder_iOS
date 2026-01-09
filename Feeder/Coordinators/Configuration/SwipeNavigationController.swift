//
//  SwipeNavigationController.swift
//  Feeder
//
//  Created by Nick Goncharenko on 29.12.2025.
//

import SwiftUI

final class SwipeNavigationController: UINavigationController, UIGestureRecognizerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        isNavigationBarHidden = true
        
        interactivePopGestureRecognizer?.delegate = self
        interactivePopGestureRecognizer?.isEnabled = true
    }
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        // swipe-back only if there is somewhere to return
        return viewControllers.count > 1
    }
}

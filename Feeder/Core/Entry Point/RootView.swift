//
//  RootView.swift
//  Feeder
//
//  Created by Nick Goncharenko on 14.12.2025.
//

import SwiftUI

struct RootView: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> UINavigationController {
        let navigationController = UINavigationController()
        navigationController.isNavigationBarHidden = true
        
        let router = Router(navigationController: navigationController)
        let coordinator = AppCoordinator(router: router)
        
        coordinator.start()
        
        return navigationController
    }
    
    func updateUIViewController(
        _ uiViewController: UINavigationController,
        context: Context
    ) {}
}

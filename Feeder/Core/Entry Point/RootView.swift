//
//  RootView.swift
//  Feeder
//
//  Created by Nick Goncharenko on 14.12.2025.
//

import SwiftUI

struct RootView: UIViewControllerRepresentable {
    
    func makeCoordinator() -> Holder {
        Holder()
    }
    
    func makeUIViewController(context: Context) -> UINavigationController {
        let navigationController = SwipeNavigationController()
        let router = RouterImpl(navigationController: navigationController)
        let coordinator = AppCoordinator(router: router)
        
        context.coordinator.appCoordinator = coordinator
        coordinator.start()
        
        return navigationController
    }
    
    func updateUIViewController(
        _ uiViewController: UINavigationController,
        context: Context
    ) {}
    
    // STRONG HOLDER
    final class Holder {
        var appCoordinator: AppCoordinator?
    }
}

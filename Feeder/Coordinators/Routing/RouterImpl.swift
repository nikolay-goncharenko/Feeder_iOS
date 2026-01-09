//
//  RouterImpl.swift
//  Feeder
//
//  Created by Nick Goncharenko on 08.01.2026.
//

import UIKit

final class RouterImpl: Router {
    
    // MARK: - Reference to UINavigationController
    private weak var navigationController: UINavigationController?
    
    // MARK: - Initializer
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - UINavigationController navigation
    func open(module: any BaseModule, completion: (() -> Void)? = nil) {
        guard let navigation = navigationController else { return }
        
        CATransaction.begin()
        CATransaction.setCompletionBlock {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                completion?()
            }
        }
        
        navigation.pushViewController(module.viewController, animated: true)
        CATransaction.commit()
    }
    
    func openAsRoot(module: any BaseModule, animated: Bool = true) {
        navigationController?.setViewControllers([module.viewController], animated: animated)
    }
    
    func closeModule(animated: Bool = true, completion: (() -> Void)? = nil) {
        navigationController?.popViewController(animated: animated)
        completion?()
    }
    
    func closeToRootModule(animated: Bool = true, completion: (() -> Void)? = nil) {
        navigationController?.popToRootViewController(animated: animated)
        completion?()
    }
    
    // MARK: - Overlay navigation
    func openOverlay(
        viewController: BaseViewController, style: OverlayPresentationStyle = .automatic,
        animated: Bool = true, completion: (() -> Void)? = nil
    ) {
        viewController.modalPresentationStyle = style.uiKitStyle
        navigationController?.present(viewController, animated: animated, completion: completion)
    }
    
    func closeOverlay(animated: Bool = true, completion: (() -> Void)? = nil) {
        navigationController?.dismiss(animated: animated, completion: completion)
    }
}

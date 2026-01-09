//
//  Router.swift
//  Feeder
//
//  Created by Nick Goncharenko on 14.12.2025.
//

protocol Router {
    func open(module: any BaseModule, completion: (() -> Void)?)
    func openAsRoot(module: any BaseModule, animated: Bool)
    
    func closeModule(animated: Bool, completion: (() -> Void)?)
    func closeToRootModule(animated: Bool, completion: (() -> Void)?)
    
    func openOverlay(
        viewController: BaseViewController, style: OverlayPresentationStyle,
        animated: Bool, completion: (() -> Void)?
    )
    func closeOverlay(animated: Bool, completion: (() -> Void)?)
}

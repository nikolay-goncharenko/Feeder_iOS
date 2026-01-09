//
//  OverlayFactory.swift
//  Feeder
//
//  Created by Nick Goncharenko on 07.01.2026.
//

protocol OverlayFactory {
    
    func makeCenteredAlert(
        title: String,
        description: String,
        onOK: @escaping () -> Void
    ) -> BaseViewController
    
    func makeSortSheet(
        onByDate: @escaping () -> Void,
        onByRating: @escaping () -> Void,
        onCancel: @escaping () -> Void
    ) -> BaseViewController
}

protocol OverlayFactoryProtocol {
    var overlayFactory: OverlayFactory { get }
}

final class OverlayFactoryImpl: OverlayFactory {
    
    func makeCenteredAlert(
        title: String,
        description: String,
        onOK: @escaping () -> Void
    ) -> BaseViewController {
        
        let alert = CenterActionAlert(
            title: title,
            description: description,
            action: onOK
        )
        
        let viewController = BaseViewController(rootView: alert)
        viewController.backgroundStyle = .clear
        return viewController
    }
    
    func makeSortSheet(
        onByDate: @escaping () -> Void,
        onByRating: @escaping () -> Void,
        onCancel: @escaping () -> Void
    ) -> BaseViewController {
        
        let view = BottomActionSheet(
            byDate: onByDate,
            byRating: onByRating,
            cancelAction: onCancel
        )
        
        let viewController = BaseViewController(rootView: view)
        viewController.backgroundStyle = .clear
        return viewController
    }
}

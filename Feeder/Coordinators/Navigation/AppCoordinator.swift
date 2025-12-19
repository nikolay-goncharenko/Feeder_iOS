//
//  AppCoordinator.swift
//  Feeder
//
//  Created by Nick Goncharenko on 14.12.2025.
//

final class AppCoordinator: BaseCoordinator {
    
    var childCoordinators: [BaseCoordinator] = []
    
    private let router: RouterProtocol
    
    init(router: RouterProtocol) {
        self.router = router
    }
    
    func start() {
        let module = FeedModule()
        module.store.intentListener = { [weak self] intent in
            self?.hanble(intent)
        }
        router.openAsRoot(module: module, animated: false)
    }
    
    private func hanble(_ intent: FeedIntent) {
        switch intent {
        case .initializer:
            print("Initializer")
        }
    }
}

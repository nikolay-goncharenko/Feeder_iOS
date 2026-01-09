//
//  AppCoordinator.swift
//  Feeder
//
//  Created by Nick Goncharenko on 14.12.2025.
//

final class AppCoordinator: BaseCoordinator {
    
    var childCoordinators: [BaseCoordinator] = []
    let router: Router
    
    init(router: Router) {
        self.router = router
    }
    
    func start() {
        openFeedFlow()
    }
    
    private func openFeedFlow() {
        let coordinator = startChild(
            FeedCoordinator(router: router)
        )
        
        coordinator.onFinish = { [weak self, weak coordinator] in
            self?.remove(coordinator)
        }
    }
}

//
//  FeedCoordinator.swift
//  Feeder
//
//  Created by Nick Goncharenko on 06.01.2026.
//

final class FeedCoordinator: BaseCoordinator, ModuleFactoryProtocol, OverlayFactoryProtocol {
    
    var childCoordinators: [BaseCoordinator] = []
    var onFinish: (() -> Void)?
    
    let router: Router
    let moduleFactory: ModuleFactory
    let overlayFactory: OverlayFactory
    
    var postLoadingFailed: ((FirebaseError) -> Void)?
    
    init(
        router: Router,
        moduleFactory: ModuleFactory = ModuleFactoryImpl(),
        overlayFactory: OverlayFactory = OverlayFactoryImpl()
    ) {
        self.router = router
        self.moduleFactory = moduleFactory
        self.overlayFactory = overlayFactory
    }
    
    func start() {
        let module = moduleFactory.makeFeedModule()
        
        module.store.onShowSort = { [weak self] in
            self?.showSortSheet(on: module.store)
        }
        
        module.store.onRouteToDetails = { [weak self] id in
            self?.openFeedPostDetails(by: id)
        }
        
        postLoadingFailed = { error in
            module.store.send(.showExternalError(error))
        }
        
        module.store.onShowAlert = { [weak self] message in
            self?.showAlert(with: message)
        }
        
        router.openAsRoot(module: module, animated: true)
    }
    
    private func showAlert(with message: String) {
        let centeredAlert = overlayFactory.makeCenteredAlert(
            title: "Post unavailable",
            description: message,
            onOK: { [weak self] in
                self?.router.closeOverlay(animated: false, completion: nil)
            }
        )
        
        router.openOverlay(
            viewController: centeredAlert,
            style: .overCurrentContext,
            animated: false,
            completion: nil
        )
    }
    
    private func showSortSheet(on store: FeedStore) {
        let bottomSheet = overlayFactory.makeSortSheet(
            
            onByDate: { [weak self, weak store] in
                store?.send(.sortByDate)
                self?.router.closeOverlay(animated: false, completion: nil)
            }, onByRating: { [weak self, weak store] in
                store?.send(.sortByRating)
                self?.router.closeOverlay(animated: false, completion: nil)
            }, onCancel: { [weak self] in
                self?.router.closeOverlay(animated: false, completion: nil)
            }
        )
        
        router.openOverlay(
            viewController: bottomSheet,
            style: .overCurrentContext,
            animated: false,
            completion: nil
        )
    }
    
    private func openFeedPostDetails(by id: Int) {
        let coordinator = startChild(
            PostDetailsCoordinator(
                router: router,
                moduleFactory: moduleFactory,
                postId: id
            )
        )
        
        coordinator.onFinish = { [weak self, weak coordinator] error in
            guard let error else { return }
            self?.postLoadingFailed?(error)
            self?.remove(coordinator)
            
        }
    }
}

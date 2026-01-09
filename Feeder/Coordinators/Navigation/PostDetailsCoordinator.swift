//
//  PostDetailsCoordinator.swift
//  Feeder
//
//  Created by Nick Goncharenko on 06.01.2026.
//

final class PostDetailsCoordinator: BaseCoordinator, ModuleFactoryProtocol {
    
    var childCoordinators: [BaseCoordinator] = []
    var onFinish: ((FirebaseError?) -> Void)?
    
    let router: Router
    let moduleFactory: ModuleFactory
    
    private let postId: Int
    
    init(
        router: Router,
        moduleFactory: ModuleFactory,
        postId: Int
        
    ) {
        self.router = router
        self.moduleFactory = moduleFactory
        self.postId = postId
    }
    
    func start() {
        let module = moduleFactory.makePostDetailsModule(postId: postId)
        
        module.store.onBack = { [weak self] in
            self?.router.closeModule(animated: true, completion: nil)
            self?.onFinish?(nil)
        }
        
        module.store.onShowAlert = { [weak self] error in
            self?.router.closeModule(animated: true, completion: nil)
            self?.onFinish?(error)
        }
        
        router.open(module: module, completion: nil)
    }
}

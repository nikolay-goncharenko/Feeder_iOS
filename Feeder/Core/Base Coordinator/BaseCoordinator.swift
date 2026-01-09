//
//  BaseCoordinator.swift
//  Feeder
//
//  Created by Nick Goncharenko on 14.12.2025.
//

protocol BaseCoordinator: AnyObject {
    var childCoordinators: [BaseCoordinator] { get set }
    var router: Router { get }
    
    func start()
}

extension BaseCoordinator {
    
    func startChild<T: BaseCoordinator>(_ coordinator: T) -> T {
        childCoordinators.append(coordinator)
        coordinator.start()
        return coordinator
    }
    
    func remove(_ coordinator: BaseCoordinator?) {
        guard let coordinator else { return }
        childCoordinators.removeAll { $0 === coordinator }
    }
}

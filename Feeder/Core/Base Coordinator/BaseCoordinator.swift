//
//  BaseCoordinator.swift
//  Feeder
//
//  Created by Nick Goncharenko on 14.12.2025.
//

protocol BaseCoordinator: AnyObject {
    var childCoordinators: [BaseCoordinator] { get set }
    func start()
}

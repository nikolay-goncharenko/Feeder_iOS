//
//  BaseModule.swift
//  Feeder
//
//  Created by Nick Goncharenko on 13.12.2025.
//

protocol BaseModule {
    associatedtype Store
    
    var store: Store { get }
    var viewController: BaseViewController { get }
}

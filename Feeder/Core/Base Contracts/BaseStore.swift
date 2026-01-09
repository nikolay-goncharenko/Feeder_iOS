//
//  BaseStore.swift
//  Feeder
//
//  Created by Nick Goncharenko on 14.12.2025.
//

import Combine

protocol BaseStore: ObservableObject {
    associatedtype State
    associatedtype Intent
    
    var state: State { get }
    
    func send(_ intent: Intent)
}

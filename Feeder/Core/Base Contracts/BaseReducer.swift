//
//  BaseReducer.swift
//  Feeder
//
//  Created by Nick Goncharenko on 14.12.2025.
//

protocol BaseReducer {
    associatedtype State
    associatedtype Intent
    
    func reduce(state: inout State, intent: Intent)
}

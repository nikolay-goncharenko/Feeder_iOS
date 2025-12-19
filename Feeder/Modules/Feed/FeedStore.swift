//
//  FeedStore.swift
//  Feeder
//
//  Created by Nick Goncharenko on 13.12.2025.
//

import Combine

final class FeedStore: BaseStore {
    @Published private(set) var state: FeedState
    var intentListener: ((FeedIntent) -> Void)?
    
    private let reducer: FeedReducer
    
    init(state: FeedState, reducer: FeedReducer) {
        self.state = state
        self.reducer = reducer
    }
    
    func send(_ intent: FeedIntent) {
        reducer.reduce(state: &state, intent: intent)
        
        if case .initializer = intent {
            
        }
    }
}

//
//  FeedStore.swift
//  Feeder
//
//  Created by Nick Goncharenko on 13.12.2025.
//

import Combine
import Foundation

final class FeedStore: BaseStore {
    @Published private(set) var state: FeedState
    
    var onShowSort: (() -> Void)?
    var onShowAlert: ((String) -> Void)?
    var onRouteToDetails: ((Int) -> Void)?
    
    private let reducer: FeedReducer
    private let service: FeedListService
    private var cancellables = Set<AnyCancellable>()
    
    init(
        state: FeedState,
        reducer: FeedReducer,
        service: FeedListService = FeedListServiceImpl()
    ) {
        self.state = state
        self.reducer = reducer
        self.service = service
    }
    
    func send(_ intent: FeedIntent) {
        reducer.reduce(state: &state, intent: intent)
        
        switch intent {
        case .feedIsLoading:
            if state.isLoading {
                observedFeedList()
            }
            
        case .openFeedPostDetails(let id):
            onRouteToDetails?(id)
            
        case .sortBtnDidTouch:
            onShowSort?()
            
        case .sortByDate:
            reducer.reduce(state: &state, intent: .sortByDate)
            
        case .sortByRating:
            reducer.reduce(state: &state, intent: .sortByRating)
            
        case .showExternalError(let error):
            onShowAlert?(error.errorDescription)
            
        default: break
        }
    }
    
    private func observedFeedList() {
        service.observeFeedList()
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] completion in
                    if case .failure(let error) = completion {
                        
                        let apiError = (error as? FirebaseError) ?? .dataError
                        self?.send(.feedLoadingFailed(apiError))
                    }
                },
                receiveValue: { [weak self] list in
                    self?.send(.feedObserved(list))
                }
            )
            .store(in: &cancellables)
    }
    
    func cancelObserving() {
        cancellables.forEach { $0.cancel() }
        cancellables.removeAll()
    }
}

//
//  PostDetailsStore.swift
//  Feeder
//
//  Created by Nick Goncharenko on 28.12.2025.
//

import Combine
import Foundation

final class PostDetailsStore: BaseStore {
    @Published private(set) var state: PostDetailsState
    
    var onBack: (() -> Void)?
    var onShowAlert: ((FirebaseError) -> Void)?
    
    private let reducer: PostDetailsReducer
    private let service: PostService
    private var cancellables = Set<AnyCancellable>()
    
    init(
        state: PostDetailsState,
        reducer: PostDetailsReducer,
        service: PostService = PostServiceImpl()
    ) {
        self.state = state
        self.reducer = reducer
        self.service = service
    }
    
    func send(_ intent: PostDetailsIntent) {
        reducer.reduce(state: &state, intent: intent)
        
        switch intent {
        case .postIsLoading:
            if state.isLoading {
                fetchPost(by: state.postId)
            }
            
        case .getBackToFeed:
            onBack?()
            
        default: break
        }
    }
    
    private func fetchPost(by Id: Int) {
        service.fetchPost(id: Id)
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] completion in
                    if case .failure(let error) = completion {
                        
                        let apiError = (error as? FirebaseError) ?? .dataError
                        self?.onShowAlert?(apiError)
                    }
                },
                receiveValue: { [weak self] post in
                    self?.send(.postFetched(post))
                }
            )
            .store(in: &cancellables)
    }
}

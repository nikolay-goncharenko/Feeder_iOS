//
//  PostDetailsReducer.swift
//  Feeder
//
//  Created by Nick Goncharenko on 28.12.2025.
//

struct PostDetailsReducer: BaseReducer {
    
    func reduce(state: inout PostDetailsState, intent: PostDetailsIntent) {
        
        switch intent {
        case .postIsLoading:
            guard !state.isLoading else { return }
            state.isLoading = true
            
        case .postFetched(let post):
            state.postDetails = post
            state.isLoading = false
            
        default: break
        }
    }
}

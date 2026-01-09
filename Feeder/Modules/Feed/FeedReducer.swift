//
//  FeedReducer.swift
//  Feeder
//
//  Created by Nick Goncharenko on 13.12.2025.
//

struct FeedReducer: BaseReducer {
    
    func reduce(state: inout FeedState, intent: FeedIntent) {
        
        switch intent {
        case .feedIsLoading:
            guard !state.isLoading else { return }
            state.isLoading = true
            state.feedNotFound = nil
            
        case .feedObserved(let list):
            state.feedList = list
            state.isLoading = false
            
        case .feedLoadingFailed(let error):
            state.feedNotFound = error.errorDescription
            
        case .sortByDate:
            state.feedList.sort { $0.timestamp > $1.timestamp }
            
        case .sortByRating:
            state.feedList.sort { $0.likesCount > $1.likesCount }
            
        default: break
        }
    }
}

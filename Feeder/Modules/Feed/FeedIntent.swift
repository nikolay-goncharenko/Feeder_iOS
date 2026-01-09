//
//  FeedIntent.swift
//  Feeder
//
//  Created by Nick Goncharenko on 13.12.2025.
//

enum FeedIntent {
    // Feed
    case feedIsLoading
    case feedObserved([FeedListDTO])
    
    // Sorting
    case sortBtnDidTouch
    case sortByDate
    case sortByRating
    
    // Open module
    case openFeedPostDetails(id: Int)
    
    // Errors
    case feedLoadingFailed(FirebaseError)
    case showExternalError(FirebaseError)
}

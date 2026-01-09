//
//  PostDetailsIntent.swift
//  Feeder
//
//  Created by Nick Goncharenko on 28.12.2025.
//

enum PostDetailsIntent {
    case postIsLoading
    case postFetched(PostDTO)
    
    case getBackToFeed
}

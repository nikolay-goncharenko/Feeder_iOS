//
//  FeedState.swift
//  Feeder
//
//  Created by Nick Goncharenko on 13.12.2025.
//

struct FeedState {
    var isLoading: Bool = false
    var feedList: [FeedListDTO] = []
    var feedNotFound: String?
}

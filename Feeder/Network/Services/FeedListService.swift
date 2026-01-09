//
//  FeedListService.swift
//  Feeder
//
//  Created by Nick Goncharenko on 25.12.2025.
//

import Combine

protocol FeedListService {
    func observeFeedList() -> AnyPublisher<[FeedListDTO], Error>
}

final class FeedListServiceImpl: FeedListService {
    
    private let firebaseService: FirebaseService
    
    init(firebaseService: FirebaseService = FirebaseServiceImpl()) {
        self.firebaseService = firebaseService
    }
    
    func observeFeedList() -> AnyPublisher<[FeedListDTO], Error> {
        firebaseService.observe(
            path: Endpoints.feedList.path,
            type: FeedListDTO.self
        )
    }
}

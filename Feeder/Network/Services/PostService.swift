//
//  PostService.swift
//  Feeder
//
//  Created by Nick Goncharenko on 25.12.2025.
//

import Combine

protocol PostService {
    func fetchPost(id: Int) -> AnyPublisher<PostDTO, Error>
}

final class PostServiceImpl: PostService {
    
    private let firebaseService: FirebaseService
    
    init(firebaseService: FirebaseService = FirebaseServiceImpl()) {
        self.firebaseService = firebaseService
    }
    
    func fetchPost(id: Int) -> AnyPublisher<PostDTO, Error> {
        firebaseService.fetchOnce(
            path: Endpoints.postDetails(by: id).path,
            type: PostDTO.self
        )
    }
}

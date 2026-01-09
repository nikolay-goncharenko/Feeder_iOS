//
//  FirebaseService.swift
//  Feeder
//
//  Created by Nick Goncharenko on 28.12.2025.
//

import Combine
import FirebaseDatabase

protocol FirebaseService {
    func observe<T: Decodable>(path: String, type: T.Type) -> AnyPublisher<[T], Error>
    
    func fetchOnce<T: Decodable>(path: String, type: T.Type) -> AnyPublisher<T, Error>
}

final class FirebaseServiceImpl: FirebaseService {
    
    private let database = Database.database().reference()
    
    func observe<T: Decodable>(path: String, type: T.Type) -> AnyPublisher<[T], Error> {
        FirebaseCollectionPublisher(ref: database.child(path))
            .eraseToAnyPublisher()
    }
    
    func fetchOnce<T: Decodable>(path: String, type: T.Type) -> AnyPublisher<T, Error> {
        FirebaseObjectPublisher(ref: database.child(path))
            .first()
            .eraseToAnyPublisher()
    }
}

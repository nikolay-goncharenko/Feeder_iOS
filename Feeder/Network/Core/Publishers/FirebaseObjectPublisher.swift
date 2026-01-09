//
//  FirebaseObjectPublisher.swift
//  Feeder
//
//  Created by Nick Goncharenko on 28.12.2025.
//

import Combine
import FirebaseDatabaseInternal

struct FirebaseObjectPublisher<T: Decodable>: Publisher {
    
    typealias Output = T
    typealias Failure = Error
    
    let ref: DatabaseReference
    
    func receive<S>(subscriber: S)
    where S: Subscriber, Failure == S.Failure, Output == S.Input {
        
        let subscription = FirebaseObjectSubscription(
            subscriber: subscriber,
            ref: ref
        )
        
        subscriber.receive(subscription: subscription)
    }
}

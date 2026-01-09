//
//  FirebaseObjectSubscription.swift
//  Feeder
//
//  Created by Nick Goncharenko on 28.12.2025.
//

import Combine
import FirebaseDatabaseInternal

final class FirebaseObjectSubscription<S: Subscriber, T: Decodable>: Subscription
where S.Input == T, S.Failure == Error {
    
    private var subscriber: S?
    private let ref: DatabaseReference
    
    init(subscriber: S, ref: DatabaseReference) {
        self.subscriber = subscriber
        self.ref = ref
        
        ref.observeSingleEvent(of: .value) { snapshot in
            guard snapshot.exists(),
                  let value = snapshot.value,
                  !(value is NSNull)
            else {
                subscriber.receive(completion: .failure(FirebaseError.postNotFound))
                return
            }
            
            do {
                let data = try JSONSerialization.data(withJSONObject: value)
                let model = try JSONDecoder().decode(T.self, from: data)
                _ = subscriber.receive(model)
                subscriber.receive(completion: .finished)
            } catch {
                subscriber.receive(completion: .failure(error))
            }
        }
    }
    
    func request(_ demand: Subscribers.Demand) {}
    
    func cancel() {
        ref.removeAllObservers()
        subscriber = nil
    }
}

//
//  FirebaseCollectionSubscription.swift
//  Feeder
//
//  Created by Nick Goncharenko on 28.12.2025.
//

import Combine
import FirebaseDatabaseInternal

final class FirebaseCollectionSubscription<S: Subscriber, T: Decodable>: Subscription
where S.Input == [T], S.Failure == Error {
    
    private var subscriber: S?
    private let ref: DatabaseReference
    
    init(subscriber: S, ref: DatabaseReference) {
        self.subscriber = subscriber
        self.ref = ref
        
        ref.observe(.value) { snapshot in
            do {
                var result: [T] = []
                
                for child in snapshot.children {
                    guard let snap = child as? DataSnapshot else { continue }
                    let data = try JSONSerialization.data(
                        withJSONObject: snap.value ?? [:]
                    )
                    let model = try JSONDecoder().decode(T.self, from: data)
                    result.append(model)
                }
                
                _ = subscriber.receive(result)
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

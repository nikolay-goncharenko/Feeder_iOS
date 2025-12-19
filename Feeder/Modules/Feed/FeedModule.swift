//
//  FeedModule.swift
//  Feeder
//
//  Created by Nick Goncharenko on 13.12.2025.
//

struct FeedModule: BaseModule {
    let store: FeedStore
    let viewController: BaseViewController
    
    init() {
        let initState = FeedState()
        let reducer = FeedReducer()
        let store = FeedStore(
            state: initState,
            reducer: reducer
        )
        let view = FeedView(store: store)
        let viewController = BaseViewController(rootView: view)
        viewController.statusbarStyle = .light
        
        self.store = store
        self.viewController = viewController
    }
}

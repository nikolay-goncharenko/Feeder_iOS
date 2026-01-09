//
//  PostDetailsModule.swift
//  Feeder
//
//  Created by Nick Goncharenko on 28.12.2025.
//

struct PostDetailsModule: BaseModule {
    var store: PostDetailsStore
    var viewController: BaseViewController
    
    init(by id: Int) {
        let initState = PostDetailsState(postId: id)
        let reducer = PostDetailsReducer()
        let store = PostDetailsStore(
            state: initState,
            reducer: reducer
        )
        let view = PostDetailsView(store: store)
        let viewController = BaseViewController(rootView: view)
        
        viewController.statusbarStyle = .light
        viewController.backgroundStyle = .clear
        
        self.store = store
        self.viewController = viewController
    }
}

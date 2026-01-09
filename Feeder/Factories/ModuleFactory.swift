//
//  ModuleFactory.swift
//  Feeder
//
//  Created by Nick Goncharenko on 07.01.2026.
//

protocol ModuleFactory {
    func makeFeedModule() -> FeedModule
    func makePostDetailsModule(postId: Int) -> PostDetailsModule
}

protocol ModuleFactoryProtocol {
    var moduleFactory: ModuleFactory { get }
}

final class ModuleFactoryImpl: ModuleFactory {
    
    func makeFeedModule() -> FeedModule {
        FeedModule()
    }
    
    func makePostDetailsModule(postId: Int) -> PostDetailsModule {
        PostDetailsModule(by: postId)
    }
}

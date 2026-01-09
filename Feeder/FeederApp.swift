//
//  FeederApp.swift
//  Feeder
//
//  Created by Nick Goncharenko on 13.12.2025.
//

import SwiftUI
import FirebaseCore
import FirebaseDatabaseInternal

@main
struct FeederApp: App {
    
    init() {
        FirebaseApp.configure()
        Database.database().isPersistenceEnabled = true
    }
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .ignoresSafeArea()
                .background(.coreBlack)
        }
    }
}

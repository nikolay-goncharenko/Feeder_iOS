//
//  FeedView.swift
//  Feeder
//
//  Created by Nick Goncharenko on 13.12.2025.
//

import SwiftUI

struct FeedView: View {
    @ObservedObject var store: FeedStore
    
    var body: some View {
        VStack(spacing: 0) {
            
            // Status Bar
            Res.color.systemBlack
                .frame(height: UIApplication.shared
                    .connectedScenes
                    .compactMap { ($0 as? UIWindowScene)?.keyWindow }
                    .first?
                    .safeAreaInsets.top ?? 0
                )
            
            // Header
            HeaderView(title: "New Test")
            
            Spacer()
        }
        .ignoresSafeArea(.container, edges: .top)
    }
}

#Preview {
    FeedModule().viewController.rootView
}

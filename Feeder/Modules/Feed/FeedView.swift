//
//  FeedView.swift
//  Feeder
//
//  Created by Nick Goncharenko on 13.12.2025.
//

import SwiftUI

struct FeedView: View {
    @ObservedObject var store: FeedStore
    
    private enum Layout {
        static let gridSpacing: CGFloat = 16
    }
    
    var body: some View {
        GeometryReader { proxy in
            content(statusBarHeight: proxy.safeAreaInsets.top)
        }
        .onAppear {
            store.send(.feedIsLoading)
        }
    }
    
    func content(statusBarHeight: CGFloat) -> some View {
        VStack(spacing: 0) {
            statusBar(height: statusBarHeight)
            header
            feedContent
        }
        .ignoresSafeArea(.container, edges: .top)
    }
    
    func statusBar(height: CGFloat) -> some View {
        Color(R.color.coreBlack)
            .frame(height: height)
    }
    
    var header: some View {
        NavigationHeaderView(
            button: HybridButton(
                icon: Res.image.sortIcon,
                title: "Sort",
                style: .light
            ) {
                store.send(.sortBtnDidTouch)
            },
            title: "Feeder",
            logo: Res.image.natifeLogo
        )
    }
    
    @ViewBuilder
    var feedContent: some View {
        if store.state.isLoading {
            loadingView
        } else if let error = store.state.feedNotFound {
            errorView(text: error)
        } else {
            feedList
        }
    }
    
    var loadingView: some View {
        ProgressView("Feed is loading...")
    }
    
    func errorView(text: String) -> some View {
        VStack {
            Spacer()
            Text(text)
                .padding(.vertical)
            Spacer()
        }
    }
    
    var feedList: some View {
        ScrollView {
            LazyVGrid(
                columns: [GridItem(.flexible())],
                spacing: Layout.gridSpacing
            ) {
                ForEach(store.state.feedList, id: \.postId) { item in
                    ItemCell(
                        dto: item,
                        action: {
                            store.send(.openFeedPostDetails(id: item.postId))
                        }
                    )
                }
            }
        }
        .background(Res.color.ghostGrey)
    }
}

#Preview {
    FeedModule().viewController.rootView
}

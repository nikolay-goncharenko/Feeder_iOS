//
//  PostDetailsView.swift
//  Feeder
//
//  Created by Nick Goncharenko on 28.12.2025.
//

import SwiftUI
import NukeUI

struct PostDetailsView: View {
    @ObservedObject var store: PostDetailsStore
    
    private enum Layout {
        static let horizontalPadding: CGFloat = 20
        static let textSpacing: CGFloat = 16
        static let imageSpacing: CGFloat = 12
        static let minImageHeight: CGFloat = 200
        static let imageSkeletonHeight: CGFloat = 250
        static let iconSize: CGFloat = 14
        static let shadowRadius: CGFloat = 5
        static let shadowYOffset: CGFloat = 5
    }
    
    var body: some View {
        GeometryReader { proxy in
            content(statusBarHeight: proxy.safeAreaInsets.top)
        }
        .onAppear {
            store.send(.postIsLoading)
        }
    }
    
    @ViewBuilder
    private func content(statusBarHeight: CGFloat) -> some View {
        VStack(spacing: 0) {
            statusBar(height: statusBarHeight)
            mainContent
        }
        .ignoresSafeArea(.container, edges: .top)
        .background(Res.color.coreWhite)
    }
    
    @ViewBuilder
    private func statusBar(height: CGFloat) -> some View {
        Color(R.color.coreBlack)
            .frame(height: height)
    }
    
    @ViewBuilder
    private var mainContent: some View {
        if let post = store.state.postDetails {
            postContent(post)
        } else if store.state.isLoading {
            loadingView
        }
    }
    
    @ViewBuilder
    private func postContent(_ post: PostDTO) -> some View {
        VStack(spacing: 0) {
            header(title: post.title)
            
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 0) {
                    textColumnView(title: post.title, text: post.text)
                    imagesColumnView(urls: post.images ?? [])
                    statisticsColumnView(
                        likes: post.likesCount,
                        timestamp: post.timestamp
                    )
                }
            }
        }
    }
    
    private func header(title: String) -> some View {
        NavigationHeaderView(
            button: IconButton(icon: Res.image.getBackIcon) {
                store.send(.getBackToFeed)
            },
            title: title
        )
    }
    
    @ViewBuilder
    private func textColumnView(title: String, text: String) -> some View {
        VStack(alignment: .leading, spacing: Layout.textSpacing) {
            Text(title)
                .font(Res.font.sfProTextBold(24))
                .foregroundColor(Res.color.coreBlack)
            
            Text(text)
                .font(Res.font.sfProTextRegular(16))
                .lineSpacing(4)
                .foregroundColor(Res.color.coreBlack)
        }
        .padding(Layout.horizontalPadding)
    }
    
    @ViewBuilder
    private func imagesColumnView(urls: [String]) -> some View {
        VStack(spacing: Layout.imageSpacing) {
            ForEach(urls, id: \.self) { urlString in
                LazyImage(url: URL(string: urlString)) { state in
                    if let image = state.image {
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(minHeight: Layout.minImageHeight)
                            .clipped()
                    } else if state.isLoading {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.gray.opacity(0.1))
                            .frame(height: Layout.imageSkeletonHeight)
                    }
                }
            }
        }
        .padding(.horizontal, Layout.horizontalPadding)
    }
    
    @ViewBuilder
    private func statisticsColumnView(likes: Int, timestamp: Int) -> some View {
        HStack {
            HStack(spacing: 8) {
                Image(R.image.heartIcon)
                    .resizable()
                    .frame(
                        width: Layout.iconSize,
                        height: Layout.iconSize
                    )
                
                Text("\(likes)")
                    .font(Res.font.sfProTextBold(14))
            }
            
            Spacer()
            
            Text(timestamp.toRelativeDate)
                .font(Res.font.sfProTextRegular(14))
                .foregroundColor(.secondary)
        }
        .padding(Layout.horizontalPadding)
        .background(Res.color.coreWhite)
        .shadow(
            color: .black.opacity(0.05),
            radius: Layout.shadowRadius,
            y: Layout.shadowYOffset
        )
    }
    
    private var loadingView: some View {
        VStack {
            Spacer()
            ProgressView("Post is loading...")
            Spacer()
        }
    }
}

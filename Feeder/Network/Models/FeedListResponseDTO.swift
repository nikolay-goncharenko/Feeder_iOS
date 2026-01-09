//
//  FeedListResponseDTO.swift
//  Feeder
//
//  Created by Nick Goncharenko on 25.12.2025.
//

typealias FeedListResponse = [String: FeedListDTO]

struct FeedListDTO: Decodable {
    enum CodingKeys: String, CodingKey {
        case postId, timestamp, title
        case previewText = "preview_text"
        case likesCount = "likes_count"
    }
    
    let postId, timestamp: Int
    let title, previewText: String
    let likesCount: Int
}

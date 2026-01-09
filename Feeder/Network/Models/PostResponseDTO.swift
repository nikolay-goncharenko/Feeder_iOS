//
//  PostResponseDTO.swift
//  Feeder
//
//  Created by Nick Goncharenko on 25.12.2025.
//

typealias PostResponse = [String: PostDTO]

struct PostDTO: Decodable {
    enum CodingKeys: String, CodingKey {
        case postId, timestamp, title, text, images
        case likesCount = "likes_count"
    }
    
    let postId, timestamp: Int
    let title, text: String
    let images: [String]?
    let likesCount: Int
}

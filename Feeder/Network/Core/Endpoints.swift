//
//  Endpoints.swift
//  Feeder
//
//  Created by Nick Goncharenko on 25.12.2025.
//

enum Endpoints {
    case feedList
    case postDetails(by: Int)
    
    var path: String {
        switch self {
        case .feedList:
            return "post_previews"
        case .postDetails(let id):
            return "post_details/\(id)"
        }
    }
}

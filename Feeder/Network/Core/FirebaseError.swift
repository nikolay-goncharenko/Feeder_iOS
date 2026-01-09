//
//  FirebaseError.swift
//  Feeder
//
//  Created by Nick Goncharenko on 03.01.2026.
//

import Foundation

enum FirebaseError: Error, LocalizedError {
    case feedNotFound
    case postNotFound
    case dataError
    
    var errorDescription: String {
        switch self {
        case .feedNotFound:
            return "Failed to load news feed. Please refresh the page."
        case .postNotFound:
            return "Sorry, this post is no longer available."
        case .dataError:
            return "Data error. We are already working on a fix."
        }
    }
    
    var recoverySuggestion: String {
        return "Please check your internet connection or try again later."
    }
}

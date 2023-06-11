//
//  LoadingState.swift
//  BlogPostFetcher
//
//  Created by Matt on 08/06/2023.
//

import Foundation

enum LoadingState {
    case loading
    case success([Blog])
    case error(Error)
}

extension LoadingState: Equatable {
    static func == (lhs: LoadingState, rhs: LoadingState) -> Bool {
        switch (lhs, rhs) {
        case (.loading, .loading): return true
        case (.success(_), .success(_)): return true
        case (.error(_), .error(_)): return true
        default: return false
        }
    }
}

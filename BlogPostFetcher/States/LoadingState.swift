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

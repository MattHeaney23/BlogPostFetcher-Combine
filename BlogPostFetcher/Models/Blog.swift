//
//  Blog.swift
//  BlogPostFetcher
//
//  Created by Matt on 08/06/2023.
//

import Foundation

class Blog: Codable, Identifiable {
    let blogger: String
    let id: Int
    let title: String
    let body: String
}

extension Blog: Equatable {
    static func == (lhs: Blog, rhs: Blog) -> Bool {
        lhs.id == rhs.id
    }
}

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
    
    init(blogger: String,
         id: Int,
         title: String,
         body: String) {
        self.blogger = blogger
        self.id = id
        self.title = title
        self.body = body
    }
}

extension Blog: Equatable {
    static func == (lhs: Blog, rhs: Blog) -> Bool {
        lhs.id == rhs.id
    }
}

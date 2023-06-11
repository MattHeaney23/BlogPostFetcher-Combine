//
//  BlogPostRow.swift
//  BlogPostFetcher
//
//  Created by Matt on 11/06/2023.
//

import SwiftUI

struct BlogPostRow: View {
    
    let blog: Blog
    
    var body: some View {
        VStack {
            Text(blog.title)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack {
                Text("Blogger: \(blog.blogger)")
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

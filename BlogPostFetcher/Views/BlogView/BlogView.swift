//
//  BlogView.swift
//  BlogPostFetcher
//
//  Created by Matt on 12/06/2023.
//

import SwiftUI

struct BlogView: View {
    
    //MARK: Dependancies
    let viewModel: BlogViewModel
    
    //MARK: Body
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 16) {
                Text(viewModel.blog.title)
                    .font(.largeTitle)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("By \(viewModel.blog.blogger)")
                    .font(.subheadline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Divider()
                
                Text(viewModel.blog.body)
                    .font(.body)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.horizontal, 16)
        }
    }
}

struct BlogView_Previews: PreviewProvider {
    static var previews: some View {
        BlogView(viewModel: BlogViewModel(blog: Blog(blogger: "Matt Heaney",
                                                     id: 1,
                                                     title: "Test Title",
                                                     body: "Test Body")))
    }
}

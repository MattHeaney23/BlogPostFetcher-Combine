//
//  BlogPostsView.swift
//  BlogPostFetcher
//
//  Created by Matt on 08/06/2023.
//

import SwiftUI

struct BlogPostsView: View {
    
    @ObservedObject var viewModel = BlogPostsViewModel()
    
    var body: some View {
        
        VStack {
            
            Spacer()
            
            switch viewModel.loadingState {
            case .loading: Text("Loading")
            case .error(let error): Text("Error")
            case .success(let blogs): Text("Blogs! \(blogs.count) of them!")
            }
            
            Spacer()
        
            Button {
                viewModel.refreshSubject.send()
            } label: {
                Text("Let's refresh!")
            }
            
        }
    }
}

struct BlogPostsView_Previews: PreviewProvider {
    static var previews: some View {
        BlogPostsView()
    }
}

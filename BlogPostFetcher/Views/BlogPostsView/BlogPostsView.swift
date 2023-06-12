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
        
        VStack(spacing: 0) {
            switch viewModel.loadingState {
            case .loading: LoadingComponent()
            case .error(let error): ErrorComponent(error: error)
            case .success(let blogs): blogList(blogs)
            }
        }
        .toolbar {
            if viewModel.loadingState != .loading {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        viewModel.refreshSubject.send()
                    } label: {
                        Image(systemName: "arrow.clockwise")
                            .foregroundColor(.black)
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.gray.opacity(0.05))
    }
    
    //MARK: Views
    func blogList(_ blogs: [Blog]) -> some View {
        List {
            ForEach(blogs) { blog in
                BlogPostRow(blog: blog)
            }
        }
        .background(.gray)
    }
}

struct BlogPostsView_Previews: PreviewProvider {
    static var previews: some View {
        BlogPostsView()
    }
}

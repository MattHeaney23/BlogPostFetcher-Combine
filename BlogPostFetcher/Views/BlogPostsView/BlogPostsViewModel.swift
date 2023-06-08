//
//  BlogPostsViewModel.swift
//  BlogPostFetcher
//
//  Created by Matt on 08/06/2023.
//

import Combine
import SwiftUI

class BlogPostsViewModel: ObservableObject {
    
    public var refreshSubject: PassthroughSubject<Void, Never>
    private var cancellables = Set<AnyCancellable>()
    private let networkService: NetworkService<[Blog]>
    
    @Published var loadingState: LoadingState = .loading
    
    init() {
        self.networkService = NetworkService<[Blog]>()
        self.refreshSubject = PassthroughSubject()
        self.prepareSubscribers()
        self.refreshSubject.send()
    }
    
    private func prepareSubscribers() {
        
        guard let url = URLs.blogPostURL else {
            self.loadingState = .error(NetworkError.InvalidURL)
            return
        }
        
        refreshSubject
            .debounce(for: .seconds(1), scheduler: DispatchQueue.global(qos: .background))
            .flatMap { self.networkService.fetchData(url: url) }
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished: return
                case .failure(let error): self.loadingState = .error(error)
                }
            } receiveValue: { posts in
                self.loadingState = .success(posts)
            }
            .store(in: &self.cancellables)
    }
}


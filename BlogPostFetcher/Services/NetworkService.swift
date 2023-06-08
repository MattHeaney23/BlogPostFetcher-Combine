//
//  NetworkService.swift
//  BlogPostFetcher
//
//  Created by Matt on 08/06/2023.
//

import Combine
import Foundation

class NetworkService<T: Codable> {
    func fetchData(url: URL) -> AnyPublisher<T, Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}

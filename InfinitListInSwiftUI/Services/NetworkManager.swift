//
//  NetworkManager.swift
//  NetworkManager
//
//  Created by Alexey Efimov on 29.08.2021.
//

import Combine
import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    func getUsers(perPage: Int = 30, sinceId: Int? = nil) -> AnyPublisher<[User], Error> {
        var urlComponents = URLComponents(string: "https://api.github.com/users")!
        urlComponents.queryItems = [
            URLQueryItem(name: "per_page", value: "\(perPage)"),
            URLQueryItem(name: "since", value: sinceId != nil ? "\(sinceId!)" : nil)
        ]
        let request = URLRequest(url: urlComponents.url!, timeoutInterval: 10)
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: [User].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}

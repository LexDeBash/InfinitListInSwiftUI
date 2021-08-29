//
//  UserViewModel.swift
//  UserViewModel
//
//  Created by Alexey Efimov on 29.08.2021.
//

import Combine
import Foundation

class UserViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var isRequestFailed = false
    
    private let pageLimit = 25
    private var currentLastId: Int?
    private var cancellable: AnyCancellable?
    
    func getUsers() {
        cancellable = NetworkManager.shared.getUsers(perPage: pageLimit, sinceId: currentLastId)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    print("Finished")
                case .failure(let error):
                    self.isRequestFailed = true
                    print(error.localizedDescription)
                }
            } receiveValue: { users in
                self.users.append(contentsOf: users)
                self.currentLastId = users.last?.id
            }
    }
}

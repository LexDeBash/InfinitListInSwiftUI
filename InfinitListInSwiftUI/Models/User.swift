//
//  User.swift
//  User
//
//  Created by Alexey Efimov on 27.08.2021.
//

struct User {
    let id: Int
    let name: String
    let avatarURL: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "login"
        case avatarURL = "avatar_url"
    }
}

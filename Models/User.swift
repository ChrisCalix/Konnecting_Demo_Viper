//
//  User.swift
//  Models
//
//  Created by Christian Calixto on 22/4/23.
//

import Foundation

public struct User {

    public let email: String
    public let username: String

    init(email: String, username: String) {

        self.email = email
        self.username = username
    }
}

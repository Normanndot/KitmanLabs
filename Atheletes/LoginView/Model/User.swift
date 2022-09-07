//
//  LoginModel.swift
//  Atheletes
//
//  Created by Norman, ThankaVijay on 08/09/22.
//

import Foundation

struct User: Decodable {
    let username: String
}

struct Credentials: Encodable {
    let username: String
    let password: String
}

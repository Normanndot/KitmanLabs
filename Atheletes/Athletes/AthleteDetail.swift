//
//  AthleteDetail.swift
//  Atheletes
//
//  Created by Norman, ThankaVijay on 08/09/22.
//

import Foundation

// MARK: - AtheleteDetailElement
struct AthleteDetail: Decodable {
    let firstName, lastName: String
    let id: Int
    let image: AtheleteImage
    let username: String
    let squadIDS: [Int]

    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case id, image, username
        case squadIDS = "squad_ids"
    }
}

// MARK: - Image
struct AtheleteImage: Decodable {
    let url: String
}

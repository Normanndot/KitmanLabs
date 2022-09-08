//
//  SquadDetail.swift
//  Atheletes
//
//  Created by Norman, ThankaVijay on 08/09/22.
//

import Foundation

// MARK: - SquadElement
struct SquadElement: Identifiable, Decodable {
    let createdAt: String
    let id: Int
    let name: String
    let organisationID: Int
    let updatedAt: String

    enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
        case id, name
        case organisationID = "organisation_id"
        case updatedAt = "updated_at"
    }
}

typealias Squads = [SquadElement]

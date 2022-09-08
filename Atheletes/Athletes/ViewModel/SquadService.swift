//
//  SquadService.swift
//  Atheletes
//
//  Created by Norman, ThankaVijay on 08/09/22.
//

import Foundation
import ServiceHandler

protocol SquadServicing {
    func fetch() async throws -> Squads
}

class SquadService: SquadServicing {
    private let service: NetworkServiable

    init(service: NetworkServiable) {
        self.service = service
    }

    func fetch() async throws -> Squads {
        return try await service.fetch(request: Requests.Athletes.squads())
    }
}

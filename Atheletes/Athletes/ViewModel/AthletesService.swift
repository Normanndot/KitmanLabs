//
//  AthletesService.swift
//  Atheletes
//
//  Created by Norman, ThankaVijay on 08/09/22.
//

import Foundation
import ServiceHandler

protocol AthleteServicing {
    func fetch() async throws -> [AthlteDetail]
}

class AthletesService: AthleteServicing {
    private let service: NetworkServiable

    init(service: NetworkServiable) {
        self.service = service
    }

    func fetch() async throws -> [AthlteDetail] {
        return try await service.fetch(request: Requests.Athletes.athletes())
    }
}

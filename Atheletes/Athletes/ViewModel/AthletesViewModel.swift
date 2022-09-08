//
//  AthletesViewModel.swift
//  Atheletes
//
//  Created by Norman, ThankaVijay on 08/09/22.
//

import Foundation

@MainActor
class AthletesViewModel: ObservableObject {
    private let service: AthleteServicing
    @Published var athlete: [AthleteModel]?
    @Published var errorMessage: String?

    init(service: AthleteServicing) {
        self.service = service
    }

    func fetchAthleteList() async {
        do {
            let response = try await service.fetch()
            self.athlete = response.compactMap {
                AthleteModel(name: $0.firstName + " " + $0.lastName,
                             id: $0.id, squad: "", profileImage: $0.image.url)
            }
        } catch {
            errorMessage = error.localizedDescription
        }

    }
}

//
//  AthletesViewModel.swift
//  Atheletes
//
//  Created by Norman, ThankaVijay on 08/09/22.
//

import Foundation

@MainActor
class AthletesViewModel: ObservableObject {
    private let athleteService: AthleteServicing
    private let squadService: SquadServicing

    @Published var athlete: [AthleteModel]?
    @Published var errorMessage: String?

    init(athleteService: AthleteServicing, squadService: SquadServicing) {
        self.athleteService = athleteService
        self.squadService = squadService
    }

    func fetchAthleteList() async {
        do {
            let athleteResponse = try await athleteService.fetch()
            let squadResponse = try await squadService.fetch()
            var squadValues = [Int: String]()

            self.athlete = athleteResponse.compactMap {
                var squads = ""
                let squadIDs = $0.squadIDS
//
//                for squadID in squadIDs {
//                    for squadDetail in squadResponse {
//                        if squadID == squadDetail.id {
//                            squads.append(squadDetail.name)
//                        }
//                    }
//                }

                for squadID in squadIDs {
                    if squadValues[squadID] == nil {
                        for squadDetail in squadResponse {
                            if squadID == squadDetail.id {
                                squadValues[squadID] = squadDetail.name
                                squads += "\(squadDetail.name) "
                                break
                            }
                        }
                    } else {
                        squads += "\(squadValues[squadID] ?? "") "
                    }
                }

                return AthleteModel(name: $0.firstName + " " + $0.lastName,
                             id: $0.id,
                             squad: squads,
                             profileImage: $0.image.url)
            }
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}

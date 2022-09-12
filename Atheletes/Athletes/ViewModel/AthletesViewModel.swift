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


            self.athlete = athleteResponse.compactMap { detail in
                var squads = ""
                let squadIDs = detail.squadIDS

//                for squadID in squadIDs {
//                    for squadDetail in squadResponse {
//                        if squadID == squadDetail.id {
//                            squads.append(squadDetail.name)
//                        }
//                    }
//                }
                
                let sqaudList = Dictionary(uniqueKeysWithValues: zip(squadIDs, repeatElement(0, count: detail.squadIDS.count)))

                for sd in squadResponse {
                    if let _ = sqaudList[sd.id] {
                        if squads == "" {
                            squads = sd.name
                        } else {
                            squads = squads + ", " + sd.name
                        }
                    }
                }

//                for squadID in squadIDs {
//                    if squadValues[squadID] == nil {
//                        for squadDetail in squadResponse {
//                            if squadID == squadDetail.id {
//                                squadValues[squadID] = squadDetail.name
//                                squads += "\(squadDetail.name) "
//                                break
//                            }
//                        }
//                    } else {
//                        squads += "\(squadValues[squadID] ?? "") "
//                    }
//                }

                return AthleteModel(name: detail.firstName + " " + detail.lastName,
                                    id: detail.id,
                                    squad: squads,
                                    profileImage: detail.image.url)
            }
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}

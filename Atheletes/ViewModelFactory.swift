//
//  ViewModelFactory.swift
//  Atheletes
//
//  Created by Norman, ThankaVijay on 08/09/22.
//

import Foundation
import ServiceHandler

class ViewModelFactory {
    private lazy var service: NetworkServiable = {
        NetworkService()
    }()

    @MainActor
    func loginViewModel() -> LoginViewModel {
        LoginViewModel(service: AuthenticationService(service: service), storage: SessionStorage())
    }

    @MainActor
    func athletesViewModel() -> AthletesViewModel {
        AthletesViewModel(athleteService: AthletesService(service: service),
                          squadService: SquadService(service: service))
    }

}

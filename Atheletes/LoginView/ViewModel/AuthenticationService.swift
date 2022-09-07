//
//  AuthenticationService.swift
//  Atheletes
//
//  Created by Norman, ThankaVijay on 08/09/22.
//

import Foundation

protocol Authenticatable {
    func authenticate(with userName: String, password: String) async throws -> User
}

class AuthenticationService: Authenticatable {
    private let service: NetworkServiable

    init(service: NetworkServiable) {
        self.service = service
    }

    func authenticate(with userName: String, password: String) async throws -> User {
        return try await service.fetch(request:
                                        Requests.Authentication.authenticate(with:
                                                                                Credentials(username: userName,
                                                                                            password: password)
                                                                            )
        )
    }
}

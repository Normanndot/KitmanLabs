//
//  LoginViewModel.swift
//  Atheletes
//
//  Created by Norman, ThankaVijay on 06/09/22.
//

import Foundation
import SwiftUI

@MainActor
class LoginViewModel: ObservableObject {
    private let service: Authenticatable
    private let storage: SessionStoring
    private var appState: Appstate?
    @Published var errorMessage: String?

    @Published var sessionID: String? {
        didSet {
            storage.set(userName: sessionID)
        }
    }

    init(service: Authenticatable, storage: SessionStoring) {
        self.service = service
        self.storage = storage
        self.sessionID = storage.sessionID
    }

    func set(appState: Appstate) {
        self.appState = appState
    }

    func login(userName: String, password: String) async {
        do {
            let response = try await service.authenticate(with: userName, password: password)
            self.sessionID = response.username
            appState?.isLoggedIn = true
        } catch {
            if let error =  error as? RequestError {
                handleNetworkError(type: error)
            } else {
                errorMessage = "Login failed"
            }
        }
    }

    private func handleNetworkError(type: RequestError) {
        switch type {
        case .noNetwork:
            // Recoverable by the user or the client
            errorMessage = "No Internet"
        case .unAuthenticated:
            // Recoverable by the user
            errorMessage = "Incorrect username and password"
        case .unknown, .decode, .invalidURL, .unexpectedStatusCode,
                .clientError, .serverError, .noResponse, .redirection:
            // Unrecoverable.
            errorMessage = "Login failed"
        }
    }

}

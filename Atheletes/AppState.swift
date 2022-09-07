//
//  AppState.swift
//  Atheletes
//
//  Created by Norman, ThankaVijay on 08/09/22.
//

import Foundation

@MainActor
class Appstate: ObservableObject {
    @Published var isLoggedIn: Bool

    init(isLoggedIn: Bool) {
        self.isLoggedIn = isLoggedIn
    }
}

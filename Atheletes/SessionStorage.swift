//
//  SessionStorage.swift
//  Atheletes
//
//  Created by Norman, ThankaVijay on 08/09/22.
//

import Foundation
import SwiftKeychainWrapper

protocol SessionStoring {
    var sessionID: String? { get }
    func set(userName: String?)
}

class SessionStorage: SessionStoring {

    static let shared: SessionStorage = SessionStorage()
    private static let sessionIdKey = "sessionId"

    var sessionID: String? {
        KeychainWrapper.standard.string(forKey: SessionStorage.sessionIdKey)
    }

    func set(userName: String?) {
        guard let userName = userName else {
            return
        }

        KeychainWrapper.standard.set(userName, forKey: SessionStorage.sessionIdKey)
    }

}

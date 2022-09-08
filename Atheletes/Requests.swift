//
//  Requests.swift
//  Atheletes
//
//  Created by Norman, ThankaVijay on 08/09/22.
//

import Foundation
import ServiceHandler

struct Requests {
    struct Authentication {
        static func authenticate(with credentials: Credentials) -> Request<User> {
            .init(url: .init(path: "/session")!, httpMethod: .post(credentials))
        }
    }

    struct Athletes {
        static func athletes() -> Request<[AthlteDetail]> {
            .init(url: .init(path: "/athletes")!, httpMethod: .get)
        }

        static func squads() -> Request<Squads> {
            .init(url: .init(path: "/squads")!, httpMethod: .get)
        }
    }
}

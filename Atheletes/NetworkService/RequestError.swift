//
//  RequestError.swift
//  Atheletes
//
//  Created by Norman, ThankaVijay on 07/09/22.
//

import Foundation

public enum RequestError: Error {
    case decode
    case invalidURL
    case noResponse
    case unexpectedStatusCode
    case unknown
    case redirection
    case clientError
    case serverError
    case noNetwork
    case unAuthenticated
    
    var customMessage: String {
        switch self {
        case .decode: return "Decode error"
        case .clientError: return "Session expired"
        default: return "Unknown"
        }
    }
}

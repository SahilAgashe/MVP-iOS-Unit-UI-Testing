//
//  SignupError.swift
//  PhotoApp
//
//  Created by SAHIL AMRUT AGASHE on 29/04/24.
//

import Foundation

enum SignupError: LocalizedError, Equatable {
    case invalidResponseModel
    case invalidRequestURLString
    case failedRequest(description: String)
    
    var errorDescription: String? {
        switch self {
        case .failedRequest(description: let description): description
        case .invalidResponseModel, .invalidRequestURLString: ""
        }
    }
}

//
//  SignupFormRequestModel.swift
//  PhotoApp
//
//  Created by SAHIL AMRUT AGASHE on 29/04/24.
//

import Foundation

struct SignupFormRequestModel: Encodable {
    let firstName: String
    let lastName: String
    let email: String
    let password: String
}

//
//  LoginRequest.swift
//  FirstSwift
//  Encoding this structure will create the following JSON request payload:
//
// {
//      "username": "YOUR_USERNAME",
//      "password": "YOUR_PASSWORD"
// }
//
//  Created by PhungPV_TCOM on 08/08/2023.
//

import Foundation
struct LoginRequest: Encodable {
    let username: String
    let password: String
}

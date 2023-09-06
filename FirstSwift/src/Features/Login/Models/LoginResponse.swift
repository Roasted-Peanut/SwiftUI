//
//  LoginResponse.swift
//  FirstSwift
//
//  Created by PhungPV_TCOM on 08/08/2023.
//

import Foundation

struct LoginResponse: Codable {
    let data: DataResponse?
    let message: String?
    let status: Int?
}

struct LoginError {
    let status: Int
    let message, data: String
}

struct DataResponse: Codable {
    let accessToken, refreshToken, idToken: String?
    let fullName: String?
    let gender: String?
    let status: Int?
    let username: String?
}

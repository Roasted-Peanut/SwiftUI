//
//  BaseErrorModel.swift
//  FirstSwift
//
//  Created by TCOM on 09/09/2023.
//

import Foundation

struct BaseError: Codable {
    let status: Int
    let message, data: String
}

//
//  Constans.swift
//  FirstSwift
//
//  Created by TCOM on 07/09/2023.
//

import Foundation

class Constants {
    static var buildEnv: BuildEnvironment = .Develop

    static var apiBaseUrl: String {
            get {
                switch Constants.buildEnv {
                case .Develop:
                    return "https://stimul-be.skydemo.vn"
                case .Staging:
                    return "https://6861-210-245-49-123.ngrok-free.app"
                case .Product:
                    return "http://ec2-52-56-117-47.eu-west-2.compute.amazonaws.com"
                }
            }
        }
}
enum BuildEnvironment: Int {
    case Develop = 0
    case Staging = 1
    case Product = 2
}


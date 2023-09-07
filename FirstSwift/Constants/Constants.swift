//
//  Constant.swift
//  FirstSwift
//
//  Created by TCOM on 07/09/2023.
//

import Foundation

enum BuildEnvironment: Int {
    case Develop = 0
    case Staging = 1
    case Product = 2
}

class Constanst{
    static var buildEnv: BuildEnvironment = .Develop
    
    static var apiBaseUrl: String {
        get {
            switch Constanst.buildEnv {
            case .Develop:
                return "https://jdvtwynql2.execute-api.ap-southeast-1.amazonaws.com/sit/customeracct/account-mgmt-service/api/customeracct"
            case .Staging:
                return "https://jdvtwynql2.execute-api.ap-southeast-1.amazonaws.com/sit/customeracct/account-mgmt-service/api/customeracct"
            case .Product:
                return "https://jdvtwynql2.execute-api.ap-southeast-1.amazonaws.com/sit/customeracct/account-mgmt-service/api/customeracct"
            }
        }
    }
}





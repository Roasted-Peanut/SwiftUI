//
//  LoginAction.swift
//  FirstSwift
//  xử lý call api
//  Created by PhungPV_TCOM on 08/08/2023.
//

import Foundation
import Moya

// Khai báo key enum
public enum APIService {
    // 1 Khai báo verify key nếu có
    static private let publicKey = "YOUR PUBLIC KEY"
    static private let privateKey = "YOUR PRIVATE KEY"
    
    // 2 định nghĩa case actions
    case login(username: String, password: String)
    case singin
}

// config env api

// extension sử dụng cho việc call api
extension APIService: TargetType {
    // 1 config URL
    public var baseURL: URL {
        return URL(string: Constanst.apiBaseUrl)!
    }
    
    // 2 config path cho từng case action
    public var path: String {
        switch self {
        case .login: return "/login"
        case .singin: return "/singin"
        }
    }
    
    // 3 Xác định method post | get | put ...
    public var method: Moya.Method {
        switch self {
        case .login, .singin:
            return .post
            //        default: return .get
        }
    }
    
    // 4 sample data option
    public var sampleData: Data {
        return Data()
    }
    
    // 5 Thực thi các case actions
    public var task: Task {
        switch self {
        case let .login(username, password):
            return .requestParameters(
                parameters: ["username": username, "password": password],
                encoding: JSONEncoding.default
            )
        case .singin:
            return .requestPlain
        }
    }
    
    // 6 config header
    public var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
    
    // 7
    public var validationType: ValidationType {
        return .successCodes
    }
}

class ManagerService: BaseManager<APIService> {}


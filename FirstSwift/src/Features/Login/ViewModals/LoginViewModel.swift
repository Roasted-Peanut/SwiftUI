//
//  LoginViewModel.swift
//  FirstSwift
//
//  Created by PhungPV_TCOM on 08/08/2023.
//

import Foundation
import Moya

class LoginViewModel: ObservableObject {
    let service = ManagerService()
    func login(username: String, password: String, _ complection: @escaping ((LoginResponse) -> Void), _ fail: @escaping ((Error) -> Void)) {
        service.requestAPI(.login(username: username, password: password), type: LoginResponse.self) { response in
            if response.status == 1 {
                complection(response)
            } else {
                complection(response)
            }
        } onFailed: { error in
            fail(error.self)
        }
    }
}

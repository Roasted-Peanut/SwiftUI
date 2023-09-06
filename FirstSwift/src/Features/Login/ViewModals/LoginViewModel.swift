//
//  LoginViewModel.swift
//  FirstSwift
//
//  Created by PhungPV_TCOM on 08/08/2023.
//

import Foundation
class LoginViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    func login() {
        LoginAction(
            parameters: LoginRequest(
                username: username,
                password: password
            )
        ).call {res in
            print("login success \(res)")
            // login successful, navigate to the Home screen
        }
    }
}

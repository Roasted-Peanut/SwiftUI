//
//  LoginAction.swift
//  FirstSwift
//  xử lý call api
//  Created by PhungPV_TCOM on 08/08/2023.
//

import Foundation
struct LoginAction {
    var parameters: LoginRequest
    func call(completion: @escaping (LoginResponse) -> Void) {
        let scheme: String = "https"
        let host: String = "jdvtwynql2.execute-api.ap-southeast-1.amazonaws.com"
        let path = "/sit/customeracct/account-mgmt-service/api/customeracct/login"
        var componets = URLComponents()
        componets.scheme = scheme
        componets.host = host
        componets.path = path
        guard let url = componets.url else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "post"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        do {
            request.httpBody = try JSONEncoder().encode(parameters)
        } catch {
            // error: Unable to encode request parameter
        }
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                return
            }
            do {
                if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
                    let response = try JSONDecoder().decode(LoginResponse.self, from: data)
                    print("login error:  \(response)")
//                    completion(nil)
                } else {
                    let response = try JSONDecoder().decode(LoginResponse.self, from: data)
                    completion(response)
                }
            } catch {
                print("error: \(error)")
            }
        }
        task.resume()
    }
}

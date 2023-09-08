//
//  Router.swift
//  FirstSwift
//
//  Created by TCOM on 08/09/2023.
//

import Foundation
import SwiftUI

class AppRouter: ObservableObject {
    @Published var state: AppState = .onBoard
}

enum AppState {
    case onBoard
    case home
    case setting
    case login
}




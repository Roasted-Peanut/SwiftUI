//
//  FirstSwiftApp.swift
//  FirstSwift
//
//  Created by TCOM on 07/08/2023.
//

import SwiftUI
import IQKeyboardManagerSwift



class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        IQKeyboardManager.shared.enableAutoToolbar = false
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        return true
    }
}
@main
struct FirstSwiftApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate // add this line in the struct

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

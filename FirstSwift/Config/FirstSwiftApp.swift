//
//  FirstSwiftApp.swift
//  FirstSwift
//
//  Created by TCOM on 07/08/2023.
//

import SwiftUI
import IQKeyboardManagerSwift

class AppDelegate: NSObject, UIApplicationDelegate {
    // Dismis Keyboard
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
    @StateObject var appRouter = AppRouter()
    @ViewBuilder
    var rootView: some View {
        switch appRouter.state {
        case .onBoard:
            OnboardScreen()
        case .home:
            HomeScreen()
        case .login:
            LoginScreen()
        case .setting:
            SettingScreen()
        }
    }
    var body: some Scene {
        WindowGroup {
            rootView
                .environmentObject(appRouter)
        }
    }
}

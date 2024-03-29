//
//  LoginScreen.swift
//  FirstSwift
//
//  Created by PhungPV_TCOM on 08/08/2023.
//

import SwiftUI

struct LoginScreen: View {
    
    @EnvironmentObject var appRouter: AppRouter
    @ObservedObject var viewModel: LoginViewModel = LoginViewModel()
    @State var userName: String = "7267946"
    @State var password: String = "Anh12345"
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("On-boarding")
                    .resizable()
                ScrollView(Axis.Set.vertical, showsIndicators: false) {
                    VStack(alignment: .center, spacing: 30) {
                        Image("Auth")
                        LabelView(configurations: Configuration(
                            title: "Login.LoginButton.Title",
                            size: 24, fontType: .bold,
                            foregroundColor: .white
                        ))
                        Divider()
                        VStack {
                            HStack {
                                LabelView(configurations: Configuration(
                                    title: "Login.Email",
                                    size: 12, fontType: .medium,
                                    foregroundColor: .white
                                ))
                                Spacer()
                                LabelView(configurations: Configuration(
                                    title: "Login.Phone",
                                    size: 12, fontType: .medium,
                                    foregroundColor: .white
                                ))
                            }
                            TextFieldCustom(
                                textFieldModels: TextFieldModel(placeholder: "Login.Email"),
                                field: $userName
                            )
                        }
                        
                        VStack(alignment: .leading) {
                            LabelView(configurations: Configuration(
                                title: "Login.PasswordField.Title",
                                size: 12, fontType: .medium,
                                foregroundColor: .white
                            ))
                            SecureFieldCustom(
                                textFieldModels: TextFieldModel(placeholder: "Login.PasswordField.Title"),
                                field: $password
                            )
                            LabelView(configurations: Configuration(
                                title: "Login.Forgot",
                                size: 12, fontType: .medium,
                                foregroundColor: .white
                            ))
                            .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                        VStack {
                            Button(
                                action: loginView,
                                label: {
                                    LabelView(configurations: Configuration(
                                        title: "Login.LoginButton.Title",
                                        size: 16, fontType: .bold,
                                        foregroundColor: .white
                                    ))
                                    .frame(maxWidth: .infinity, minHeight: 42)
                                    .background(Color("mainColor"))
                                    .cornerRadius(24)
                                }
                            )
                        }
                        Divider()
                        LabelView(configurations: Configuration(
                            title: "Hoặc đăng nhập với",
                            size: 14, fontType: .medium,
                            foregroundColor: .white
                        ))
                        VStack {
                            ButtonCustom(
                                buttonModel: ButtonModel(title: "Đăng nhập với Facebook", imageName: "Facebook", fontSize: 16, fontType: .bold, foregroundColor: .white),
                                action: {
                                    print("Login with facebook!")}
                            )
                            ButtonCustom(
                                buttonModel: ButtonModel(title: "Đăng nhập với Google", imageName: "Google", fontSize: 16, fontType: .bold, foregroundColor: .white),
                                action: {
                                    print("Login with Google!")}
                            )
                        }
                    }
                    .padding(.all, 24)
                    HStack {
                        LabelView(configurations: Configuration(
                            title: "Login.NotAccount",
                            size: 14, fontType: .medium,
                            foregroundColor: .white
                        ))
                        LabelView(configurations: Configuration(
                            title: "Login.Register",
                            size: 14, fontType: .bold,
                            foregroundColor: .white
                        ))                }
                }.padding(.vertical, 20)
            }
            .ignoresSafeArea()
        }
    }
    
    func loginView() {
        viewModel.login(username: userName, password: password) { success in
            appRouter.state = .home
        } _: { err in
            if let err =  err {
                print("loginView \(err)")
            } else {
                print("loginView ")
            }
        }
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}

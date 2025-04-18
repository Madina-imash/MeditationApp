//
//  SignInView.swift
//  MeditationApp
//
//  Created by Smart Castle M1A2002 on 01.03.2025.
//

import SwiftUI
import FirebaseAuth

struct SignInView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showForgotPassword = false
    @State private var showSighUp = false
    @State private var showMainView = false
    @State private var isLoading = false // Добавим индикатор загрузки для кнопки

    var body: some View {
        ZStack {
            Color(red: 37 / 255, green: 51 / 255, blue: 52 / 255)
                .edgesIgnoringSafeArea(.all)

            VStack(alignment: .leading, spacing: 20) {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)

                Text("Вход")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)

                Text("Войдите, чтобы получить доступ к своим упражнениям и сохраненной музыке")
                    .font(.system(size: 17))
                    .foregroundColor(.white.opacity(0.8))
                    .multilineTextAlignment(.leading)
                    .padding(.trailing, 40)

                VStack(alignment: .leading, spacing: 16) {
                    Text("Ваш Email")
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.7))

                    TextField("", text: $email)
                        .padding(.bottom, 10)
                        .overlay(Rectangle().frame(height: 1).foregroundColor(.white.opacity(0.5)), alignment: .bottom)

                    Text("Пароль")
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.7))

                    SecureField("", text: $password)
                        .padding(.bottom, 10)
                        .overlay(Rectangle().frame(height: 1).foregroundColor(.white.opacity(0.5)), alignment: .bottom)

                    HStack {
                        Spacer()
                        Button(action: {
                            showForgotPassword = true
                        }) {
                            Text("Забыли пароль?")
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.trailing, 30)
                    .fullScreenCover(isPresented: $showForgotPassword) {
                        ForgotPasswordView()
                    }

                    // Кнопка авторизации
                    Button(action: {
                        signInUser()
                    }) {
                        Text("Авторизоваться")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(red: 124 / 255, green: 154 / 255, blue: 146 / 255))
                            .cornerRadius(8)
                    }
                    .disabled(isLoading) // Отключаем кнопку во время загрузки
                    .overlay(
                        Group {
                            if isLoading {
                                ProgressView()
                                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                                    .padding(10)
                            }
                        }
                    )

                    HStack {
                        Text("Нет аккаунта?")
                            .foregroundColor(.white.opacity(0.7))

                        Button(action: {
                            showSighUp = true
                        }) {
                            Text("Зарегистрироваться")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                        }
                    }
                    .fullScreenCover(isPresented: $showSighUp) {
                        SignUpView()
                    }
                }
                .padding(.top, 30)
            }
            .padding(30)

            VStack {
                Spacer()
                Image("leaf_pattern")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .padding(.bottom, -80)
            }
            .padding()
        }
        .fullScreenCover(isPresented: $showMainView) {
            HomeView()
        }
    }

    func signInUser() {
        isLoading = true
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            isLoading = false
            if let error = error {
                // Печать подробной ошибки
                print("Ошибка при входе: \(error.localizedDescription)")
                
                // Покажем ошибку пользователю, если это нужно
                return
            }

            if let result = result {
                print("Успешный вход, пользователь: \(result.user.uid)")
                showMainView = true
            }
        }
    }
}

#Preview {
    SignInView()
}

//
//  SignUpView.swift
//  MeditationApp
//
//  Created by Smart Castle M1A2002 on 14.03.2025.
//

import SwiftUI
import FirebaseAuth
import FirebaseCore
import Firebase

struct SignUpView: View {
    
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State var isLoggedIn: Bool = false
    @State var errorMessage: String? = nil
     
    @State private var showSignIn = false
    var body: some View {
        ZStack {
            // Фон
            Color(red: 37 / 255, green: 51 / 255, blue: 52 / 255)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 40) {
                // Логотип и заголовок
                VStack(alignment: .leading, spacing: 20) {
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                    
                    Text("Регистрация")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text("Зарегистрируйтесь бесплатно и начните медитировать, а также изучайте Medic")
                        .font(.body)
                        .foregroundColor(.white.opacity(0.8))
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 30)
                
                // Поля ввода
                VStack(spacing: 16) {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Ваше имя")
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.7))
                            .offset(y: 25)
                        
                        TextField("", text: $name)
                            .textFieldStyle(PlainTextFieldStyle())
                            .overlay(Rectangle().frame(height: 1).foregroundColor(.white.opacity(0.5)), alignment: .bottom)
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Ваш Email")
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.7))
                            .offset(y: 20)
                        
                        TextField("Name", text: $email)
                            .textFieldStyle(PlainTextFieldStyle())
                            .overlay(Rectangle().frame(height: 1).foregroundColor(.white.opacity(0.5)), alignment: .bottom)
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Пароль")
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.7))
                            .offset(y: 20)
                        
                        SecureField("", text: $password)
                            .textFieldStyle(PlainTextFieldStyle())
                            .overlay(Rectangle().frame(height: 1).foregroundColor(.white.opacity(0.5)), alignment: .bottom)
                    }
                }
                .padding(.horizontal, 30)
                
                // Кнопка "Sign Up"
                Button(action: {
                    Auth.auth().createUser(withEmail: email, password: password) {result, error in
                        if (result?.user) != nil {
                            print("user created")
                            if let uid = result?.user.uid {
                                result?.user.sendEmailVerification() { error in
                                    if let error = error {
                                        print("Error sending confirmation email")
                                    } else {
                                        print("Email sent successfully")
                                    }
                                }
                                Firestore.firestore()
                                    .collection("users")
                                    .document(uid)
                                    .setData([
                                        "name": name,
                                        "email": email,
                                        "password": password,
                                        "isValid": false], merge: true)
                                isLoggedIn = true
                                
                            }
                            
                        } else if let error = error {
                            errorMessage = error.localizedDescription
                        }
                        
                    }
                
                }) {
                    Text("Зарегистрироваться")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(red: 124 / 255, green: 154 / 255, blue: 146 / 255))
                        .cornerRadius(8)
                }
                .padding(.horizontal, 30)
                
                // "Already have an account? Sign In"
                HStack {
                    Text("Уже есть аккаунт?")
                        .foregroundColor(.white.opacity(0.7))
                    
                    Button(action: {showSignIn = true
                        // Действие для перехода на Sign In
                    }) {
                        Text("Войти")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    }
                }
                .fullScreenCover(isPresented: $showSignIn) {
                    SignInView()
                        .padding(.bottom, 20)
                    //.frame(maxWidth: .infinity, alignment: .center)
                    
                    // Листья (внизу экрана)
                    VStack {
                        Spacer()
                        Image("leaf_pattern") // Добавь изображение в Assets
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity) // Подбери нужный размер
                            .padding(.bottom, -70) // Подкорректируй отступ, если нужно
                    }
                }
                
            }
        }
    }
}

#Preview {
    SignUpView()
}

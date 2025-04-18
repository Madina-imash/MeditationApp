//
//  ContentView.swift
//  MeditationApp
//
//  Created by Smart Castle M1A2002 on 01.03.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var logoScale: CGFloat = 1.5  // Увеличенный логотип при запуске
    @State private var showContent = false  // Скрываем текст и кнопки сначала
    @State private var showSignIn = false // Добавляем состояние
    @State private var showSignUp = false // Добавляем состояние

    var body: some View {
        ZStack {
            // Фон
            Image("background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer().frame(height: 120) // Отступ сверху
                
                // Логотип
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .scaleEffect(logoScale)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            withAnimation(.easeInOut(duration: 1)) {
                                logoScale = 1  // Уменьшаем логотип
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                withAnimation(.easeIn(duration: 1)) {
                                    showContent = true  // Показываем текст и кнопки
                                }
                            }
                        }
                    }
                
                // Остальные элементы появляются плавно
                if showContent {
                    VStack(spacing: 15) {
                        // Заголовок
                        Text("ДОБРО ПОЖАЛОВАТЬ!") 
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        // Подзаголовок
                        Text("Медитируйте \nОставайтесь сосредоточенными \nЖивите здоровой жизнью")
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                        
                        Spacer().frame(height: 40) // Отступ перед кнопками
                        
                        // Кнопка входа
                        

                        VStack {

                            Button(action: {
                                showSignIn = true
                            }) {
                                Text("Войти с помощью Email")
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color(red: 124 / 255, green: 154 / 255, blue: 146 / 255))
                                    .cornerRadius(8)
                            }
                            .fullScreenCover(isPresented: $showSignIn) {
                                SignInView()
                            }

                        
                        }
                        // Регистрация
                        HStack {
                            Text("Нет аккаунта?")
                                .foregroundColor(.white)
                            
                            Button(action: {
                                showSignUp = true
                            }) {
                                Text("Зарегистрироваться")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            }
                            .fullScreenCover(isPresented: $showSignUp) {
                                SignUpView()
                            }
                        }
                    }
                    .transition(.opacity)
                    .padding(.horizontal, 30)
                }
                
                Spacer() // Поднимаем элементы вверх
            }
        }
    }
}

#Preview {
    ContentView()
}

//
//  ForgotPasswordView.swift
//  MeditationApp
//
//  Created by Smart Castle M1A2002 on 14.03.2025.
//

import SwiftUI

struct ForgotPasswordView: View {
    @State private var email: String = ""

    var body: some View {
        ZStack {
            // Фон
            Color(red: 37 / 255, green: 51 / 255, blue: 52 / 255)
                .edgesIgnoringSafeArea(.all)

            // Основное содержимое
            VStack(alignment: .leading, spacing: 30) {
                Image("logo") // Логотип
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)

                Text("Восстановление пароля")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)

                Text("Введите свой адрес электронной почты, и мы вышлем вам ссылку для сброса пароля")
                    .font(.system(size: 16))
                    .foregroundColor(.white.opacity(0.8))
                    .multilineTextAlignment(.leading)

                VStack(alignment: .leading, spacing: 10) {
                    Text("Ваш Email")
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.7))
                        .offset(y: 25)

                    TextField("", text: $email)
                        .padding(.bottom, 10)
                        .overlay(Rectangle().frame(height: 1).foregroundColor(.white.opacity(0.5)), alignment: .bottom)
                }

                Button(action: {
                    // Действие при отправке ссылки
                }) {
                    Text("Сбросить пароль")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(red: 124 / 255, green: 154 / 255, blue: 146 / 255))
                        .cornerRadius(8)
                }
                .padding(.top, 10)

                Spacer()
            }
            .padding(30)

            // Листья (внизу экрана)
            VStack {
                Spacer()
                Image("leaf_pattern") // Добавь изображение в Assets
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity) // Подбери нужный размер
                    .padding(.bottom, -20) // Подкорректируй отступ, если нужно
            }
        }
    }
}

#Preview {
    ForgotPasswordView()
}

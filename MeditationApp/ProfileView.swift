//
//  Profile.swift
//  MeditationApp
//
//  Created by Smart Castle M1A2002 on 05.04.2025.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        
        ZStack {
            // Фон
            Color(red: 37 / 255, green: 51 / 255, blue: 52 / 255)
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading, spacing: 20) {
                
                HStack {
                    Button(action: {}) {
                        Image("line.horizontal.3") // Иконка меню
                            .resizable()
                            .frame(width: 40, height: 25)
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                    
                    Image("logo") // Логотип
                        .resizable()
                        .frame(width: 45, height: 30)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Circle() // Аватар (пока просто белый круг)
                        .frame(width: 35, height: 35)
                        .foregroundColor(.white)
                }
                .padding()
                
            }
        }
    }
}

// Предпросмотр
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}


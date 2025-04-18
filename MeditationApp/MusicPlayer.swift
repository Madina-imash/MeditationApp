//
//  MusicPlayer.swift
//  MeditationApp
//
//  Created by Smart Castle M1A2002 on 29.03.2025.
//

import SwiftUI

struct MusicPlayerView: View {
    
    var body: some View {
        ZStack {
            // Фон
            Color(red: 37 / 255, green: 51 / 255, blue: 52 / 255)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                // Верхняя панель
                HStack {
                    Button(action: {}) {
                        Image(systemName: "line.horizontal.3") // Иконка меню
                            .resizable()
                            .frame(width: 24, height: 18)
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                    
                    Image(systemName: "leaf") // Логотип
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Circle() // Аватар (пока просто белый круг)
                        .frame(width: 40, height: 40)
                        .foregroundColor(.white)
                }
                .padding()
                
                Spacer()
                
                // Изображение альбома
                Image("music_cover") // Название изображения
                    .resizable()
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
                
                // Название трека
                Text("Painting Forest")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top, 20)
                
                // Автор
                Text("By: Painting with Passion")
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.7))
                    .padding(.top, 5)
                
                // Визуализация звука
                Image(systemName: "waveform") // Используем иконку вместо реальной анимации
                    .resizable()
                    .frame(width: 200, height: 40)
                    .foregroundColor(.white.opacity(0.8))
                    .padding(.top, 20)
                
                // Контролы плеера
                HStack(spacing: 30) {
                    Image(systemName: "shuffle")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.white.opacity(0.8))
                    
                    Image(systemName: "backward.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.white)
                    
                    Button(action: {}) {
                        Image(systemName: "pause.fill") // Кнопка "Пауза"
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.white)
                            .clipShape(Circle())
                    }
                    
                    Image(systemName: "forward.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.white)
                    
                    Image(systemName: "repeat")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.white.opacity(0.8))
                }
                .padding(.top, 20)
                
                Spacer()
                
            }
        }
    }
}
//
//// Нижняя панель навигации
// BottomNavBar()
//    var body: some View {
//        HStack {
//            Image("Home")
//                .resizable()
//                .frame(width: 40, height: 40)
//                .foregroundColor(.white)
//            
//            Spacer()
//            
//            Image("Sound")
//                .resizable()
//                .frame(width: 30, height: 25)
//                .foregroundColor(.white.opacity(0.7))
//            
//            Spacer()
//            
//            Image("User")
//                .resizable()
//                .frame(width: 20, height: 25)
//                .foregroundColor(.white.opacity(0.7))
//        }
//        .padding()
//        //.background(Color.black.opacity(0.2))
//        .clipShape(Capsule())
//        .padding(.horizontal, 30)
//    }
//}
//


// Предпросмотр
struct MusicPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        MusicPlayerView()
    }
 }

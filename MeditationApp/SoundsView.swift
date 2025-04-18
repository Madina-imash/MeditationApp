//
//  SoundsView.swift
//  MeditationApp
//
//  Created by Smart Castle M1A2002 on 05.04.2025.
//

import SwiftUI

struct SoundsView: View {
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
                
                
                
                // Верхняя картинка с текстом
                ZStack(alignment: .bottomLeading) {
                    Image("relax_background") // 👉 Название твоей фоновой картинки
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 200)
                        .clipped()
                        .cornerRadius(20)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Relax Sounds")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Text("Sometimes the most productive thing you can do is relax.")
                            .font(.subheadline)
                            .foregroundColor(.white.opacity(0.8))
                        
                        Button(action: {
                            // действие на кнопку
                        }) {
                            HStack {
                                Text("Play now")
                                    .fontWeight(.bold)
                                Image(systemName: "play.circle.fill")
                            }
                            .padding(.vertical, 8)
                            .padding(.horizontal, 16)
                            .background(Color.white)
                            .foregroundColor(.black)
                            .cornerRadius(12)
                        }
                    }
                    .padding()
                }
                .padding(.horizontal)
                .padding(.top)
                
                // Заголовок списка
                Text("Tracks")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.horizontal)
                
                // Список треков
                ScrollView {
                    VStack(spacing: 20) {
                        TrackRow(imageName: "painting_forest", title: "Painting Forest", listeners: 59899, duration: "20 Min")
                        TrackRow(imageName: "mountaineers", title: "Mountaineers", listeners: 34002, duration: "15 Min")
                        TrackRow(imageName: "lovely_deserts", title: "Lovely Deserts", listeners: 75999, duration: "39 Min")
                        TrackRow(imageName: "the_hill_sides", title: "The Hill Sides", listeners: 12999, duration: "50 Min")
                    }
                    .padding(.horizontal)
                }
                
                Spacer()
            }
        }
    }
}

// Отдельная ячейка трека
struct TrackRow: View {
    var imageName: String
    var title: String
    var listeners: Int
    var duration: String
    
    var body: some View {
        HStack(spacing: 15) {
            Image(imageName)
                .resizable()
                .frame(width: 60, height: 60)
                .cornerRadius(10)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.white)
                Text("\(listeners) listeners • \(duration)")
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.7))
            }
            
            Spacer()
            
            Button(action: {
                // действие по нажатию на трек
            }) {
                Image(systemName: "play.circle.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.white)
            }
        }
    }
}

// Предпросмотр
struct SoundsView_Previews: PreviewProvider {
    static var previews: some View {
        SoundsView()
    }
}

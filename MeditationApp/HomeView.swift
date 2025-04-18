//
//  HomeView.swift
//  MeditationApp
//
//  Created by Smart Castle M1A2002 on 21.03.2025.
//

import SwiftUI

struct HomeView: View {
    
    let emotions = [
        ("calmIcon", "Спокойствие"),
        ("relaxIcon", "Расслабление"),
        ("focusIcon", "Сфокусирование"),
        ("anxiousIcon", "Раззжражение")
    ]
    
    var body: some View {
        ZStack {
            // Фон
            Color(red: 37 / 255, green: 51 / 255, blue: 52 / 255)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                // Верхняя панель
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
                
                // Приветствие
                VStack(alignment: .leading) {
                    Text("Добро пожаловать, Afreen!")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text("Как вы себя чувствуте сегодня?")
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.7))
                }
                .padding(.horizontal)
                .padding(.top, 10)
                
                // Кнопки эмоций
                HStack(spacing: 15) {
                    ForEach(emotions, id: \.0) { emotion in
                        VStack {
                            // Здесь используем ваши изображения вместо системных иконок
                            Image(emotion.0) // Замените на собственные изображения
                                .resizable()
                                .frame(width: 80, height: 80)
                                .foregroundColor(.white)
                            
                            Text(emotion.1)
                                .font(.caption)
                                .foregroundColor(.white)
                        }
                        .frame(width: 80, height: 100)
                        //.background(Color.white.opacity(0.1))
                        //.clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                }
                .padding(.top, 10)
                
                // Карточки медитаций
                VStack(spacing: 15) {
                    MeditationCard(
                        title: "Meditation 101",
                        description: "Techniques, Benefits, and a Beginner’s How-To",
                        imageName: "meditation1"
                    )
                    
                    MeditationCard(
                        title: "Cardio Meditation",
                        description: "Basics of Yoga for Beginners or Experienced Professionals",
                        imageName: "meditation2"
                    )
                }
                .padding(.top, 10)
                
                Spacer()
                
                
            }
        }
    }
}

// Компонент карточки медитации
struct MeditationCard: View {
    var title: String
    var description: String
    var imageName: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                
                Text(title)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text(description)
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.7))
                
                Button(action: {}) {
                    HStack {
                        Text("Watch now")
                            .foregroundColor(.white)
                        Image(systemName: "play.fill")
                            .foregroundColor(.white)
                    }
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
                }
                .padding(.top, 10)
            }
            
            Spacer()
            
            Image(imageName)
                .resizable()
                .frame(width: 100, height: 100)
        }
        .padding()
        .background(Color.white.opacity(0.1))
        .cornerRadius(15)
        .padding(.horizontal)
    }
}

//// Нижняя панель навигации
//struct HomeView: View {
//    var body: some View {
//        VStack {
//            Text("Главная страница")
//            Spacer()
//            BottomNavBar(selectedTab: .home)
//        }
//    }
//}
// 
 
 // Предпросмотр
 struct HomeView_Previews: PreviewProvider {
 static var previews: some View {
 HomeView()
 }
 }

/*struct MainView {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("adfsas")
                }
            MusicPlayer()
                .tabItem {
                    Label
                }
        }
    }
 }*/

//
//  BottomNavBar.swift
//  MeditationApp
//
//  Created by Smart Castle M1A2002 on 29.03.2025.
//
/*import SwiftUI

struct BottomNavBar: View {
    enum Tab {
        case home, music, profile
    }
    
    @Banding var selectedTab: Tab
    
    var body: some View {
        HStack {
            Spacer()
            navItem(imageName: "Home", tab: .home, size: 40)
            Spacer()
            navItem(imageName: "Sound", tab: .music, size: 30)
            Spacer()
            navItem(imageName: "User", tab: .profile, size: 25)
            Spacer()
        }
        .padding()
        .background(Color.black.opacity(0.2))
        .clipShape(Capsule())
        .padding(.horizontal, 30)
    }
    
    private func navItem(imageName: String, tab: Tab, size: CGFloat) -> some View {
        Image(imageName)
            .resizable()
            .frame(width: size, height: size)
            .foregroundColor(selectedTab == tab ? .white : .white.opacity(0.7))
    }
 }/**/*/

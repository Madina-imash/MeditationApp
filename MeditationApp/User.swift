//
//  User.swift
//  MeditationApp
//
//  Created by Smart Castle M1A2002 on 21.03.2025.
//

import Foundation

struct User: Identifiable {
    var id = UUID()
    var name: String = ""
    var email: String = ""
    var password: String = ""
   
}

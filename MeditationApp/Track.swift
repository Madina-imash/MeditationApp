//
//  Track.swift
//  MeditationApp
//
//  Created by Smart Castle M1A2002 on 19.04.2025.
//

import Foundation

struct JamendoResponse: Decodable {
    let results: [Track]
}

struct Track: Decodable, Identifiable {
    var id: String { track_id }
    let track_id: String
    let name: String
    let artist_name: String
    let audio: String // Ссылка на аудио
}


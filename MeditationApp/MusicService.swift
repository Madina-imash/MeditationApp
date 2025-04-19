//
//  MusicService.swift
//  MeditationApp
//
//  Created by Smart Castle M1A2002 on 19.04.2025.
//

import Foundation

class MusicService {
    static let shared = MusicService()
    
    private let clientID = "ТВОЙ_API_КЛЮЧ" // вставь сюда свой ключ от Jamendo
    
    func fetchRelaxTracks(completion: @escaping ([Track]) -> Void) {
        let urlString = "https://api.jamendo.com/v3.0/tracks/?client_id=\(clientID)&format=json&limit=10&tags=relax&include=musicinfo"

        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let result = try JSONDecoder().decode(JamendoResponse.self, from: data)
                    DispatchQueue.main.async {
                        completion(result.results)
                    }
                } catch {
                    print("Ошибка при декодировании: \(error)")
                }
            }
        }.resume()
    }
}


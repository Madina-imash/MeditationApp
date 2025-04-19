//
//  MusicViewModel.swift
//  MeditationApp
//
//  Created by Smart Castle M1A2002 on 19.04.2025.
//

import Foundation

class MusicViewModel: ObservableObject {
    @Published var tracks: [Track] = []
    
    func loadTracks() {
        MusicService.shared.fetchRelaxTracks { [weak self] tracks in
            self?.tracks = tracks
        }
    }
}


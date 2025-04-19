//
//  MeditationMusicView.swift
//  MeditationApp
//
//  Created by Smart Castle M1A2002 on 19.04.2025.
//

import SwiftUI
import AVFoundation

struct MeditationMusicView: View {
    @StateObject private var viewModel = MusicViewModel()
    @State private var player: AVPlayer?

    var body: some View {
        VStack {
            Text("Музыка для медитации")
                .font(.title2)
                .padding(.top)
                .foregroundColor(.white)

            List(viewModel.tracks) { track in
                VStack(alignment: .leading, spacing: 8) {
                    Text(track.name)
                        .font(.headline)
                        .foregroundColor(.white)
                    Text(track.artist_name)
                        .font(.subheadline)
                        .foregroundColor(.gray)

                    Button(action: {
                        if let url = URL(string: track.audio) {
                            player = AVPlayer(url: url)
                            player?.play()
                        }
                    }) {
                        Text("Слушать")
                            .foregroundColor(.white)
                            .padding(6)
                            .background(Color.green)
                            .cornerRadius(6)
                    }
                }
                .padding(.vertical, 8)
                .listRowBackground(Color(red: 37 / 255, green: 51 / 255, blue: 52 / 255))
            }
            .onAppear {
                viewModel.loadTracks()
            }
        }
        .background(Color(red: 37 / 255, green: 51 / 255, blue: 52 / 255))
        .edgesIgnoringSafeArea(.all)
    }
}

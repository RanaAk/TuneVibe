//
//  AudioPlayerViewModel.swift
//  TuneVibe
//
//  Created by RANA  on 14/10/24.
//

import Foundation
import AVFoundation
import Combine


class AudioPlayerViewModel: ObservableObject {
    
    @Published var player: AVPlayer?
    @Published var isPlaying: Bool = false
    @Published var duration: Double = 0
    @Published var currentTime: Double = 0
    
    private var timeObserverToken: Any?

    func loadAudio(from urlString: String) async {
        guard let url = URL(string: urlString) else {
            print("Sorry Problem")
            return
        }

        let playerItem = AVPlayerItem(url: url)
        player = AVPlayer(playerItem: playerItem)
        print(player as Any)

        // Load duration
        do {
            let assetDuration = try await playerItem.asset.load(.duration)
            self.duration = CMTimeGetSeconds(assetDuration)
        } catch {
            print("Failed to load duration: \(error)")
        }
        
        print("3")
        addTimeObserver()
    }

    func playAudio() {
        player?.play()
        isPlaying = true
    }

    
    func pauseAudio() {
        player?.pause()
        isPlaying = false
    }


    func seekAudio(to time: Double) {
        let targetTime = CMTime(seconds: time, preferredTimescale: 600)
        player?.seek(to: targetTime)
    }

    
    private func addTimeObserver() {
        let interval = CMTime(seconds: 1, preferredTimescale: 600)
        timeObserverToken = player?.addPeriodicTimeObserver(forInterval: interval, queue: .main) { [weak self] time in
            self?.currentTime = CMTimeGetSeconds(time)
        }
    }

    deinit {
        if let token = timeObserverToken {
            player?.removeTimeObserver(token)
            timeObserverToken = nil
        }
    }
}

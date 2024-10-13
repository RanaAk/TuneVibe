//
//  Song.swift
//  TuneVibe
//
//  Created by RANA  on 13/10/24.
//

import Foundation

struct Song: Identifiable, Codable {
    let id: String
    var name: String
    var artist: String
    var songUrl: String
    var genres: [Genre]
    var image: String?
    var duration: Double?

    init(id: String, Name: String, Artist: String, songUrl: String, genres: [Genre], image: String? = nil, duration: Double? = nil) {
        self.id = id
        self.name = Name
        self.artist = Artist
        self.songUrl = songUrl
        self.genres = genres
        self.image = image
        self.duration = duration
    }
}

enum Genre: String, Codable, CaseIterable {
    case rock
    case pop
    case jazz
    case classical
    case hipHop = "hip-hop"
    case electronic
    case country
    case reggae
    case blues

    // Returns a capitalized name for displaying
    var displayName: String {
        switch self {
        case .hipHop: return "Hip-Hop"
        default: return self.rawValue.capitalized
        }
    }
}

extension Song {
   static var MockData = Song(id: "", Name: "Tu ne Jo na kaha", Artist: "arogot", songUrl: "", genres: [.blues , .classical])
    
}

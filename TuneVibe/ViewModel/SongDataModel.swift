//
//  SongDataModel.swift
//  TuneVibe
//
//  Created by RANA  on 14/10/24.
//

import Foundation
import FirebaseFirestore
import FirebaseStorage


@MainActor
class SongDataModel : ObservableObject {
    @Published var Songs : [Song] = []
    
    init(){
        print("Calling 6")
        Task {
            try await fetchSongs()
            print("Calling 1")
        }
    }
    
    
    func fetchSongs() async throws {
        
        do{
            let db = Firestore.firestore()
            let docRef = try await db.collection("songs").getDocuments()
            
            let fetchedSongs : [Song] = try docRef.documents.compactMap{ song in
                try song.data(as: Song.self)
            }
            
            self.Songs = fetchedSongs
      
        }catch {
            print(error.localizedDescription)
        }
        
        
    }
    
    func NextSong(songIndex : Int) -> Song?{
        return self.Songs[songIndex]
    }
}


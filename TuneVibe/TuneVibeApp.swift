//
//  TuneVibeApp.swift
//  TuneVibe
//
//  Created by RANA  on 13/10/24.
//

import SwiftUI
import Firebase


@main
struct TuneVibeApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(.dark)
        }
    }
}

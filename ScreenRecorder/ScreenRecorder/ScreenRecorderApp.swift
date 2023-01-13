//
//  ScreenRecorderApp.swift
//  ScreenRecorder
//
//  Created by Aryan Garg on 11/01/23.
//

import SwiftUI

@main
struct ScreenRecorderApp: App {
    
    @StateObject var userSong = UserSong()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(userSong)
                .onAppear {
                    loadAppData { result in
                        switch result {
                        case .failure(let error):
                            fatalError(error.localizedDescription)
                        case .success(let data):
                            appData = data
                        }
                    }
                }
        }
    }
}

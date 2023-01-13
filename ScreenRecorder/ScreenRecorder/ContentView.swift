//
//  ContentView.swift
//  ScreenRecorder
//
//  Created by Aryan Garg on 11/01/23.
//

import SwiftUI


struct ContentView: View {
    
    // Recording Status
    @State var isRecording: Bool = false
    @State var url: URL?
    @State var shareVideo: Bool = false
    //@EnvironmentObject var userSong: UserSong

    
    var body: some View {
        Text(userSong: userSong)
            .overlay(alignment: .bottomTrailing){
                Button {
                    if isRecording{
                        // Stopping
                        // Since it's a Async task
                        
                        Task{
                            do{
                                self.url = try await stopRecording()
                                isRecording = false
                                shareVideo.toggle()
                            }
                            catch {
                                print(error.localizedDescription)
                            }
                        }
                    }
                    else {
                            //Starting Recording
                            startRecording { error in
                                if let error = error{
                                    print(error.localizedDescription)
                                    return
                                }
                                
                                // Success
                                isRecording = true
                            }
                            
                        }
                }label: {
                    Image(systemName: "record.circle")
                        .font(.largeTitle)
                        .foregroundColor(isRecording ? .red : .black)
                }

            }
            .padding()
        
        // Simply call shareSheet Mpodifier
            .shareSheet(show: $shareVideo, items: [url])
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  Record.swift
//  ScreenRecorder
//
//  Created by Aryan Garg on 11/01/23.

import SwiftUI
import ReplayKit

// Mark: App Recording Extensions

extension View{

    // Start Recording
    func startRecording(enableMicrophone: Bool = true, completion: @escaping(Error?) -> ()){

        let recorder = RPScreenRecorder.shared()

        // Microphone Option
        recorder.isMicrophoneEnabled = true

        // Starting Recording
        recorder.startRecording(handler: completion)
    }

    // Stop Recording
    // It will return the Recorded Video
    func stopRecording()async throws -> URL{
        
        // File will be stored in temporary directory
        // Video Name
        
        let name = UUID().uuidString + ".mov"
        let url = FileManager.default.temporaryDirectory.appendingPathComponent(name)
        
        let recorder = RPScreenRecorder.shared()
        
        try await recorder.stopRecording(withOutput: url)
        
        return url
    }
    
    // Cancel Recording
    func cancelRecording(){
        let recorder = RPScreenRecorder.shared()
        recorder.discardRecording {}
    }
    
    
    // Share Sheet
    // It's a custom Modifier
    func shareSheet(show: Binding<Bool>, items: [Any?])->some View{
        return self
            .sheet(isPresented: show){
                
            } content: {
                // Wrapping the Optinals
                let items = items.compactMap{ item -> Any? in
                    return item
                }
                
                if !items.isEmpty{
                    ShareSheet(items: items)
                }
            }
    }
}

//
//  SharedSheet.swift
//  ScreenRecorder
//
//  Created by Vamsi Krishna Chalamalasetty on 11/01/23.
//

import SwiftUI

// UIKit Share Sheet

struct ShareSheet: UIViewControllerRepresentable{
    
    var items: [Any]
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let view = UIActivityViewController(activityItems: items, applicationActivities: nil)
        return view
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
    }
}

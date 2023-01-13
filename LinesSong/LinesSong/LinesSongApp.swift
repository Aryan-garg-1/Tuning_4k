//
//  LinesSongApp.swift
//  LinesSong
//
//  Created by Adriano Maggio on 13/01/23.
//

import SwiftUI

@main
struct LinesSongApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

//
//  CheerifyApp.swift
//  Cheerify
//
//  Created by Kari on 1/5/24.
//

import SwiftUI

@main
struct CheerifyApp: App {
    let persistenceController = PersistenceController.shared
    @Environment(\.scenePhase) var scenePhase
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
        .onChange(of: scenePhase) { _ in
            persistenceController.save()
        }
    }
}

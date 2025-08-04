//
//  Kofu_GameHub_v2App.swift
//  Kofu GameHub v2
//
//  Created by Hendratara Pratama on 01/08/25.
//

import SwiftUI
import SwiftData

@main
struct Kofu_GameHub_v2App: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            LikedGame.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            HomeView()
        }
        .modelContainer(sharedModelContainer)
    }
}

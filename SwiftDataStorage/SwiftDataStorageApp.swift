//
//  SwiftDataStorageApp.swift
//  SwiftDataStorage
//
//  Created by Danilo Osorio on 3/03/25.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataStorageApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Video.self,Metadata.self])
    }
}

//
//  Todo_AppApp.swift
//  Todo App
//
//  Created by Singgih Aji Sasongko on 22/10/24.
//

import SwiftUI

@main
struct Todo_AppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

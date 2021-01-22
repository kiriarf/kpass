//
//  kpassApp.swift
//  kpass
//
//  Created by Kiril Drobysevskij on 22/01/2021.
//

import SwiftUI

@main
struct kpassApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

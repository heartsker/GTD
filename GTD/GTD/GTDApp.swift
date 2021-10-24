//
//  GTDApp.swift
//  GTD
//
//  Created by Daniel Pustotin on 24.10.2021.
//

import SwiftUI

@main
struct GTDApp: App {
//    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            HomeView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

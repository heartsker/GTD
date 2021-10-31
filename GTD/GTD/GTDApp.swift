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
	let workspace: Workspace

	init() {
		workspace = Workspace(name: "My best workspace")
		_ = Thing.random(workspace)
	}

    var body: some Scene {
        WindowGroup {
            HomeView()
				.environmentObject(workspace)
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

//
//  HomeView.swift
//  GTD
//
//  Created by Daniel Pustotin on 24.10.2021.
//

import SwiftUI

struct HomeView: View {
    var body: some View {

		Button {
			foo()
		} label: {
			Image(systemName: "plus")
		}

    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

func foo() {

	let workspace = Workspace()

	let thing1 = Thing.random(workspace)
	let thing2 = Thing.random(workspace)
	let thing3 = Thing.random(workspace)
	let thing4 = Thing.random(workspace)
	let thing5 = Thing.random(workspace)

	print(workspace)

	print(workspace.tags)
}

extension Thing {
	static func random(_ workspace: Workspace) -> Thing {
		Thing(name: "\(Int.random(in: 1...100))", workspace: workspace, stack: .all, body: "some body")
	}
}

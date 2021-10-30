//
//  HomeView.swift
//  GTD
//
//  Created by Daniel Pustotin on 24.10.2021.
//

import SwiftUI

struct HomeView: View {

	let workspace = Workspace()

    var body: some View {

		ZStack {
//			Color.black.ignoresSafeArea()

			WorkspaceView()
				.environmentObject(workspace)
		}
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

func test() {

	let workspace = Workspace()

	let thing1 = Thing.random(workspace)
	let thing2 = Thing.random(workspace)
	let thing3 = Thing.random(workspace)
	let thing4 = Thing.random(workspace)
	let thing5 = Thing.random(workspace)

	print(workspace)

	thing1.move(to: .later)
	thing2.move(to: .await)
	thing3.move(to: .ongoing)
	thing4.move(to: .calendar)

	print(workspace)

	thing5.add(tag: Tag("new"))
	thing3.add(tag: Tag("emergersy"))

	print(workspace)

	thing1.update(tags: [Tag("hi"), Tag("end")])

	thing5.update(tags: [Tag("old")])

	print(workspace)
}

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

//	let thing1 = Thing("first")
////	sleep(UInt32.random(in: 0...10))
//	let thing2 = Thing("second")
////	sleep(UInt32.random(in: 0...10))
//	let thing3 = Thing("third")
////	sleep(UInt32.random(in: 0...10))
//	let thing4 = Thing("fourth")
////	sleep(UInt32.random(in: 0...10))
//	let thing5 = Thing("fifth")

//	workspace.add(thing1, to: .ongoing)
//	workspace.add(thing2, to: .ongoing)
//	workspace.add(thing3, to: .ongoing)
//	workspace.add(thing4, to: .ongoing)
//	workspace.add(thing5, to: .ongoing)

//	thing1.add(tag: Tag(name: "Super"))

//	workspace.move(thing1, to: .await)
//	workspace.move(thing2, to: .calendar)
//	workspace.move(thing3, to: .later)
//	workspace.move(thing4, to: .all)

	print(workspace)

	print(workspace.tags)
}

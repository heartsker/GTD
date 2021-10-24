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

	let thing1 = Thing("first", to: workspace.stacks[.all]!)
	sleep(UInt32.random(in: 0...10))
	let thing2 = Thing("second", to: workspace.stacks[.all]!)
	sleep(UInt32.random(in: 0...10))
	let thing3 = Thing("third", to: workspace.stacks[.all]!)
	sleep(UInt32.random(in: 0...10))
	let thing4 = Thing("fourth", to: workspace.stacks[.all]!)

	workspace.addThing(thing1, to: .ongoing)
	workspace.addThing(thing2, to: .all)
	workspace.addThing(thing3, to: .ongoing)
	workspace.addThing(thing4, to: .calendar)

	for stack in workspace.stacks.keys {
		print(stack.rawValue)
		for thing in workspace.stacks[stack]!.content {
			print("Name: \(thing.name)")
			print("Created: \(thing.createdDate)")
			print("Tags: \(thing.tags)")
		}
	}


}

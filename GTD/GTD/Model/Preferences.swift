//
//  Preferences.swift
//  GTD
//
//  Created by Daniel Pustotin on 24.10.2021.
//

import Foundation

class Preferences {
	var tags: Set<Tag>

	var stacks: [Stack]

	init() {
		tags = []

		stacks = []
		stacks.append(Stack(name: "Ongoing"))
		stacks.append(Stack(name: "All"))
		stacks.append(Stack(name: "Calendar"))
		stacks.append(Stack(name: "Await"))
		stacks.append(Stack(name: "Later"))
	}

	func addTag(name: String) {
		tags.insert(Tag(name: name))
	}
}

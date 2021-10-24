//
//  Manager.swift
//  GTD
//
//  Created by Daniel Pustotin on 24.10.2021.
//

import Foundation

class Workspace {

	var tags: Set<Tag>

	var stacks: [StackType: Stack]

	init() {
		tags = []
		stacks = [:]

		for type in StackType.allCases {
			stacks[type] = Stack()
		}
	}

	func addTag(name: String) {
		tags.insert(Tag(name: name))
	}

	func addThing(_ thing: Thing, to stack: StackType) {
		stacks[stack]!.content.append(thing)
	}
	
}

//
//  Manager.swift
//  GTD
//
//  Created by Daniel Pustotin on 24.10.2021.
//

import Foundation

class Workspace: CustomStringConvertible {

	var description: String {
		var str = "----------------------------------------------------------------\n"
		for stack in StackType.allCases {
			str += stacks[stack]!.description
		}
		str += "Tags: [ "
		for tag in tags {
			str += "\(tag.name) "
		}
		str += "]"
		return str
	}

	var tags: Set<Tag> {
		var all: Set<Tag> = []
		for stack in StackType.allCases {
			for thing in stacks[stack]!.content {
				all.formUnion(thing.tags)
			}
		}
		return all
	}
	private var stacks: [StackType: Stack]
	var preferences: Preferences

	init() {
		stacks = [:]
		preferences = Preferences()

		StackType.allCases.forEach { type in
			stacks[type] = Stack(type)
		}
	}

	func remove(_ thing: Thing, from stack: StackType) {
		stacks[stack]?.remove(thing)
	}

	func add(_ thing: Thing, to stack: StackType) {
		stacks[stack]?.add(thing)
	}

}

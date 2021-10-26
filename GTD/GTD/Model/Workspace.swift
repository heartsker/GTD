//
//  Manager.swift
//  GTD
//
//  Created by Daniel Pustotin on 24.10.2021.
//

import Foundation

class Workspace: CustomStringConvertible {


	var description: String {
		var str = ""
		for stack in StackType.allCases {
			str += "\n\(stack.rawValue)"
			for thing in stacks[stack]!.content {
				str += "\n✔️ \(thing.description)"
			}
		}
		return str
	}

	private(set) var tags: Set<Tag>

	private var stacks: [StackType: Stack]

	init() {
		tags = []
		stacks = [:]

		for type in StackType.allCases {
			stacks[type] = Stack()
		}
	}

	func add(tag: Tag) {
		tags.insert(tag)
	}

	func remove(tag: Tag) {
		tags.remove(tag)
	}

	func add(_ thing: Thing, to stack: StackType) {
		thing.workspace = self
		stacks[stack]?.content.append(thing)
	}

	func remove(_ thing: Thing) {
		for stack in StackType.allCases {
			stacks[stack]?.remove(thing)
		}
		thing.workspace = nil
	}

	func move(_ thing: Thing, to stack: StackType) {
		remove(thing)
		add(thing, to: stack)
	}
	
}

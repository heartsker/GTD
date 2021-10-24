//
//  Thing.swift
//  GTD
//
//  Created by Daniel Pustotin on 24.10.2021.
//

import Foundation

class Thing: Hashable {
	private(set) var name: String
	private(set) var stack: Stack
	private(set) var description: String?
	private(set) var tags: Set<Tag>

	private(set) var createdDate: Date = Date()
	private(set) var onDate: Date?
	private(set) var dueToDate: Date?

	private(set) var content: [Thing]

	init(_ name: String, to stack: Stack) {
		self.name = name
		self.stack = stack
		description = nil
		tags = []
		content = []
		createdDate = Date()
		onDate = nil
		dueToDate = nil
	}

	func addTag(_ tag: Tag) {
		tags.insert(tag)
	}

	func move(to stack: Stack) {
		self.stack = stack
	}

	static func == (lhs: Thing, rhs: Thing) -> Bool {
		lhs.name == rhs.name &&
		lhs.createdDate == rhs.createdDate
	}

	func hash(into hasher: inout Hasher) {
		hasher.combine(name)
		hasher.combine(createdDate)
	}
}

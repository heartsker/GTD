//
//  Thing.swift
//  GTD
//
//  Created by Daniel Pustotin on 24.10.2021.
//

import Foundation

class Thing: Hashable, CustomStringConvertible {
	var description: String {
		var str = "\t\(name)"
		if let details = body {
			str += "\n\t\(details)"
		}
		str += "\n\tTags: [ "
		for tag in tags {
			str += "\(tag.name) "
		}
		str += "]"
		return str
	}

	private(set) var name: String
	private(set) var stack: StackType
	private(set) var body: String?
	private(set) var tags: Set<Tag>
	private(set) var createdDate: Date = Date()

	private(set) var workspace: Workspace

	init(name: String, workspace: Workspace, stack: StackType = .all, body: String? = nil, tags: Set<Tag> = []) {
		self.name = name
		self.workspace = workspace
		self.body = body
		self.tags = tags
		self.stack = stack
		createdDate = Date.now
		self.workspace.add(self, to: stack)
	}

	deinit {
		workspace.remove(self, from: stack)
	}

	func update(name: String) {
		self.name = name
	}

	func update(details: String?) {
		self.body = description
	}

	func update(tags: Set<Tag>) {
		self.tags = tags
	}

	func move(to stack: StackType) {
		workspace.remove(self, from: self.stack)
		self.stack = stack
		workspace.add(self, to: stack)
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

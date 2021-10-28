//
//  Thing.swift
//  GTD
//
//  Created by Daniel Pustotin on 24.10.2021.
//

import Foundation

class Thing: Hashable, CustomStringConvertible {
	var description: String {
		var str = "\tName: \(name)\n"
		if let details = body {
			str += "\tDetails: \(details)\n"
		}
		str += "\tTags: [ "
		for tag in tags {
			str += "\(tag.name) "
		}
		str += "]\n"
		str += "\tCreated: \(workspace.preferences.dateString(createdDate))\n"
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

	func add(tag: Tag) {
		tags.insert(tag)
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

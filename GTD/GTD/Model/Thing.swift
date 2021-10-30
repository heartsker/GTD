//
//  Thing.swift
//  GTD
//
//  Created by Daniel Pustotin on 24.10.2021.
//

import Foundation

class Thing: Hashable, Identifiable, ObservableObject, CustomStringConvertible {

	static func random(_ workspace: Workspace) -> Thing {
		let name = "Thing #\(Int.random(in: 1...100))"
		return Thing(name: name, workspace: workspace, stack: .all, body: "Body of \(name)")
	}

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
		str += "\tCreated: \(createdDateString)\n"
		return str
	}

	var id = UUID()
	@Published private(set) var name: String
	@Published private(set) var stack: StackType
	@Published private(set) var body: String?
	@Published private(set) var tags: Set<Tag>
	@Published private(set) var createdDate: Date = Date()

	@Published private(set) var workspace: Workspace

	init(name: String, workspace: Workspace, stack: StackType = .all, body: String? = nil, tags: Set<Tag> = []) {
		self.name = name
		self.workspace = workspace
		self.body = body
		self.tags = tags
		self.stack = stack
		createdDate = Date.now
		self.workspace.add(self, to: stack)
	}

	var createdDateString: String {
		workspace.preferences.dateString(createdDate)
	}

	deinit {
		workspace.remove(self, from: stack)
	}

	func update(thing: Thing) {
		update(name: thing.name)
		update(body: thing.body)
		update(tags: thing.tags)
	}

	func update(name: String) {
		self.name = name
	}

	func update(body: String?) {
		self.body = body
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
		lhs.id == rhs.id
	}

	func hash(into hasher: inout Hasher) {
		hasher.combine(id)
	}
}

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
		if let details = details {
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
	private(set) var details: String?
	private(set) var tags: Set<Tag>

	private(set) var createdDate: Date = Date()
	private(set) var onDate: Date?
	private(set) var dueToDate: Date?

	private(set) var content: [Thing]

	var workspace: Workspace?

	init(_ name: String) {
		self.name = name
		details = nil
		tags = []
		content = []
		createdDate = Date()
		onDate = nil
		dueToDate = nil
	}

	func update(name: String) {
		self.name = name
	}

	func update(details: String?) {
		self.details = description
	}

	func remove(tag: Tag) {
		tags.remove(tag)
	}

	func add(tag: Tag) {
		tags.insert(tag)
	}

	func update(onDate: Date?) {
		self.onDate = onDate
	}

	func update(dueToDate: Date?) {
		self.dueToDate = dueToDate
	}

	func add(subThing: Thing) {
		content.append(subThing)
	}

	func remove(subThing: Thing) {
		if let idx = content.firstIndex(of: subThing) {
			content.remove(at: idx)
		}
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

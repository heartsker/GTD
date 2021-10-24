//
//  Thing.swift
//  GTD
//
//  Created by Daniel Pustotin on 24.10.2021.
//

import Foundation

class Thing: Hashable {
	var name: String
	var description: String?

	private(set) var createdDate: Date = Date()
	var onDate: Date?
	var dueToDate: Date?

	var content: [Thing]

	init(name: String) {
		self.name = name
		description = nil
		content = []
		createdDate = Date()
		onDate = nil
		dueToDate = nil
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

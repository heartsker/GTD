//
//  Stack.swift
//  GTD
//
//  Created by Daniel Pustotin on 24.10.2021.
//

import Foundation

class Stack: ObservableObject, Hashable, CustomStringConvertible {

	var description: String {
		var str = type.rawValue + " [\(count)]\n"
		for (idx, thing) in content.enumerated() {
			str += "\t[\(idx + 1)]\n" + thing.description
		}
		return str
	}

	@Published var content: [Thing]
	let type: StackType

	var count: Int {
		content.count
	}

	init(_ type: StackType) {
		self.type = type
		content = []
	}

	func add(_ thing: Thing) {
		content.append(thing)
	}

	func remove(_ thing: Thing) {
		if let idx = content.firstIndex(of: thing) {
			content.remove(at: idx)
		}
	}

	static func == (lhs: Stack, rhs: Stack) -> Bool {
		lhs.type == rhs.type && lhs.content == rhs.content
	}

	func hash(into hasher: inout Hasher) {
		hasher.combine(type)
		hasher.combine(content)
	}
}

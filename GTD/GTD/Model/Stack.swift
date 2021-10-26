//
//  Stack.swift
//  GTD
//
//  Created by Daniel Pustotin on 24.10.2021.
//

import Foundation

class Stack {
	var content: [Thing]

	init() {
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
}

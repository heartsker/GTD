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
}

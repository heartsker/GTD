//
//  Stack.swift
//  GTD
//
//  Created by Daniel Pustotin on 24.10.2021.
//

import Foundation

class Stack {
	var name: String
	var content: [Thing]

	init(name: String) {
		self.name = name
		content = []
	}

	func add(_ thing: Thing) {
		content.append(thing)
	}
}

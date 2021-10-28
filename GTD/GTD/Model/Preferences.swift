//
//  Preferences.swift
//  GTD
//
//  Created by Daniel Pustotin on 27.10.2021.
//

import Foundation

class Preferences {
	var dateFormatter: DateFormatter

	init() {
		dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "d MMM yyyy, h:mm a"
	}

	func dateString(_ date: Date) -> String {
		dateFormatter.string(from: date)
	}
}

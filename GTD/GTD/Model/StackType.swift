//
//  StackType.swift
//  GTD
//
//  Created by Daniel Pustotin on 24.10.2021.
//

import Foundation

enum StackType: String, CaseIterable {
	case ongoing = "🕗 Ongoing"
	case all = "📬 All"
	case calendar = "🗓 Calendar"
	case await = "😴 Await"
	case later = "⏳ Later"
}

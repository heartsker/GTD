	//
	//  StackView.swift
	//  GTD
	//
	//  Created by Daniel Pustotin on 30.10.2021.
	//

import SwiftUI

struct StackView: View {

	@Binding var stack: Stack

	var body: some View {

		VStack {
			Text(stack.type.rawValue)
				.font(.largeTitle)

			ScrollView {
			ForEach(stack.content) { thing in
				ThingCardView(thing: Binding(get: { thing }, set: { thing.update(thing: $0) }))
			}
			}
		}
	}
}

struct StackView_Previews: PreviewProvider {
	@State var stack: Stack = .init(.all)
	static var previews: some View {
		StackView(stack: .constant(Stack(.all)))
	}
}

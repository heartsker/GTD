	//
	//  ThingView.swift
	//  GTD
	//
	//  Created by Daniel Pustotin on 29.10.2021.
	//

import SwiftUI

struct ThingView: View {

	@Binding var thing: Thing

	var body: some View {
		ZStack {
			VStack {
				TextField("Name", text:
							Binding(
								get: { thing.name },
								set: { thing.update(name: $0) }
							),
						  prompt: nil)
					.font(.largeTitle)
					.padding()


				HStack {

					Text("Body:")
					Spacer()
					TextField("Body", text:
								Binding(
									get: { thing.body ?? "" },
									set: { thing.update(body: $0) }
								),
							  prompt: nil)
				}
				.padding()

				HStack {
					Text("Created:")
					Spacer()
					Text(thing.createdDateString)
				}
				.padding()

				Spacer()
			}
		}
	}
}

struct ThingView_Previews: PreviewProvider {
	static var previews: some View {
		ThingView(thing: .constant(Thing.random(Workspace())))
	}
}

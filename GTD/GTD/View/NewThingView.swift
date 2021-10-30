//
//  NewThingView.swift
//  GTD
//
//  Created by Daniel Pustotin on 30.10.2021.
//

import SwiftUI

struct NewThingView: View {

	@EnvironmentObject var workspace: Workspace

	@Binding var presenting: Bool

	@State var name: String = ""
	@State var bodyString: String = ""
	@State var stack: StackType = .all

    var body: some View {
		VStack {

			TextField("Name", text: $name)
				.font(.largeTitle)
				.padding()

			TextField("Body", text: $bodyString)
				.font(.largeTitle)
				.padding()

			Picker(selection: $stack, content: {
				ForEach(StackType.allCases, id: \.rawValue) {
					Text($0.rawValue)
						.font(.largeTitle)
						.padding()
				}
			}, label: { Text("Type")} )
				.font(.largeTitle)
				.padding()

			Spacer()

			Button {
				_ = Thing(name: name, workspace: workspace, stack: stack, body: bodyString)
				presenting = false
			} label: {
				Text("Add")
			}

		}
    }
}

struct NewThingView_Previews: PreviewProvider {
    static var previews: some View {
		NewThingView(presenting: .constant(true))
    }
}

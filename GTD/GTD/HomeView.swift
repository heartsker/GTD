//
//  HomeView.swift
//  GTD
//
//  Created by Daniel Pustotin on 24.10.2021.
//

import SwiftUI

struct HomeView: View {
    var body: some View {

		Button {
			print("Added")
		} label: {
			Image(systemName: "plus")
		}

    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

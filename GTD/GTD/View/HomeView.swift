//
//  HomeView.swift
//  GTD
//
//  Created by Daniel Pustotin on 24.10.2021.
//

import SwiftUI

struct HomeView: View {

	@EnvironmentObject var workspace: Workspace

    var body: some View {

		ZStack {
			WorkspaceView()
		}
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

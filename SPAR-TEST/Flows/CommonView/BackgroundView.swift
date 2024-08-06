//
//  BackgroundView.swift
//  SPAR-TEST
//
//  Created by Steven Kirke on 05.08.2024.
//

import SwiftUI

struct BackgroundView: View {

	var body: some View {
		FlatColor.BackgroundColor.light
			.edgesIgnoringSafeArea(.all)
	}
}

#if DEBUG
struct BackgroundView_Previews: PreviewProvider {
	static var previews: some View {
		BackgroundView()
	}
}
#endif

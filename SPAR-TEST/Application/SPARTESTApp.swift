//
//  SPARTESTApp.swift
//  SPAR-TEST
//
//  Created by Steven Kirke on 05.08.2024.
// r

import SwiftUI

@main
struct SPARTESTApp: App {

    var body: some Scene {
        WindowGroup {
			runFlow()
        }
    }

	private func runFlow() -> some View {
		let assembler = AssemblerCategoryScene()
		return assembler.configurator()
	}
}

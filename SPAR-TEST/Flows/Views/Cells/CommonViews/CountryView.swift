//
//  CountryView.swift
//  SPAR-TEST
//
//  Created by Steven Kirke on 06.08.2024.
//

import SwiftUI

struct CountryView: View {

	let country: Countries

	var body: some View {
		HStack(spacing: 4) {
			Text(country.title)
				.font(.system(size: 12, weight: .regular))
				.foregroundColor(FlatColor.TextColor.country)
			Image(country.flag)
				.resizable()
				.scaledToFit()
				.frame(width: 15, height: 15)
		}
		.frame(maxWidth: .infinity, alignment: .leading)
	}
}

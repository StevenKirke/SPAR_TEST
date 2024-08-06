//
//  PromotionView.swift
//  SPAR-TEST
//
//  Created by Steven Kirke on 06.08.2024.
//

import SwiftUI

/**
 Лейбл акции для карточки CellTileView.
 - Parameters:
		- text: Текст акции.
		- color: Цвет, для разных типов акций.
 - Attention: Если нет text, то блок скрывается.
 */
// MARK: - Promotion
struct Promotion: View {

	var text: String
	var color: Color = Color.clear
	private let radius = GlobalRadius.Radius.promotionPlate.self

	var body: some View {
		Text(text)
			.font(.system(size: 10, weight: .regular))
			.foregroundColor(FlatColor.TextColor.promotion)
			.padding(EdgeInsets(top: 2, leading: 12, bottom: 4, trailing: 6))
			.background(color)
			.clipShape(
				.rect(
					topLeadingRadius: radius.littleRadius,
					bottomLeadingRadius: radius.littleRadius,
					bottomTrailingRadius: radius.bitRadius,
					topTrailingRadius: radius.bitRadius
				)
			)
	}
}

//
//  OrderLikeButtons.swift
//  SPAR-TEST
//
//  Created by Steven Kirke on 06.08.2024.
//

import SwiftUI

/**
 Блок кнопок для карточки CellTileView.
 Кнопки - Чек и лайк.
 - Parameters:
		- action: Действие для кнопки "Чек".
		- action: Действие для кнопки "Лайк".
 */
// MARK: - OrderLikeButtons
struct OrderLikeButtons: View {

	let actionShowOrder: () -> Void
	let actionAddFavorite: () -> Void

	var body: some View {
		VStack(spacing: 0) {
			ButtonForImage(
				image: GlobalImages.IconButtons.iconOrderList,
				action: actionShowOrder
			)
			ButtonForImage(
				image: GlobalImages.IconButtons.iconHeard,
				action: actionAddFavorite
			)
		}
		.background(FlatColor.BackgroundColor.light)
		.clipShape(
			.rect(
				topLeadingRadius: 0,
				bottomLeadingRadius: 16,
				bottomTrailingRadius: 0,
				topTrailingRadius: 16
			)
		)
	}
}

/**
 Шаблон кнопки для карточки CellTileView.
 - Parameters:
		- image: Изображение для кнопки.  (String)
		- action: Действие.
 */
// MARK: - ButtonForImage
private struct ButtonForImage: View {
	let image: String
	let action: () -> Void

	var body: some View {
		Button(
			action: action,
			label: {
				Image(image)
					.resizable()
					.scaledToFit()
					.foregroundColor(FlatColor.BackgroundButton.blackFourty)
					.frame(width: 16, height: 16)
			}
		)
		.frame(width: 32, height: 32)
	}
}

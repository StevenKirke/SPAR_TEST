//
//  CategoryTileCell.swift
//  SPAR-TEST
//
//  Created by Steven Kirke on 05.08.2024.
//

import SwiftUI

// MARK: - CellTileView
struct CellTileView: View {

	private let radius = GlobalRadius.Radius.cellTile.self
	@Binding var modelProduct: CategoryModel.ViewModel.Product

	var body: some View {
		VStack(spacing: 0) {
			CardImageView(
				image: modelProduct.image,
				promotion: modelProduct.promotion,
				rating: modelProduct.rating,
				discount: modelProduct.discount,
				color: modelProduct.promotionType
			)
			VStack(spacing: 0) {
				Text(modelProduct.productDescription)
					.font(.system(size: 12, weight: .regular))
					.foregroundColor(FlatColor.TextColor.productDescription)
					.frame(maxWidth: .infinity, alignment: .leading)
				if !modelProduct.country.title.isEmpty {
					CountryView(country: modelProduct.country)
				}
				Spacer()
				ChangeBasketToAddProduct(modelPrice: modelProduct.price)
			}
			.padding(.horizontal, 8)
			.padding(.bottom, 4)
		}
		.frame(
			width: calculateWidth(),
			height: calculateHeight(),
			alignment: .top
		)
		.background(FlatColor.BackgroundColor.light)
		.clipShape(
			.rect(
				topLeadingRadius: radius.littleRadius,
				bottomLeadingRadius: radius.bitRadius,
				bottomTrailingRadius: radius.bitRadius,
				topTrailingRadius: radius.littleRadius
			)
		)
		.shadow(color: FlatColor.ShadowColor.grey.opacity(0.2), radius: 8, x: 0.0, y: 4.0)
	}

	private func calculateWidth() -> CGFloat {
		(UIScreen.main.bounds.width - 37) / 2
	}

	private func calculateHeight() -> CGFloat {
		let width = (UIScreen.main.bounds.width - 37) / 2
		return width * 1.6
	}
}

/**
 Блок основного изображения, акции, рейтинга, скидки, для карточки CellTileView.
 - Parameters:
		- promotion: Акция на товар.
		- rating: Рейтинг товара.
		- discount: Скидка на товара.
 - Attention: Если нет акции (promotion), то блок Promotion скрывается.
 */
// MARK: - CardImageView
private struct CardImageView: View {

	let image: String
	let promotion: String
	let rating: String
	let discount: String
	let color: Color

	var body: some View {
		ZStack(alignment: .leading) {
			ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
				Image(image)
					.resizable()
					.scaledToFill()
				OrderLikeButtons(
					actionShowOrder: {},
					actionAddFavorite: {}
				)
			}
			VStack(alignment: .leading, spacing: 0) {
				if !promotion.isEmpty {
					Promotion(text: promotion, color: color)
				}
				Spacer()
				GradeDiscountLabel(labelRating: rating, labelDiscount: discount)
			}
		}
	}
}

/**
 Блок рейтинга и скидки, для карточки CellTileView.
 - Parameters:
		- labelRating: Текст отображение рейтинга.
		- discount?: Текст скидка.
		- action: Действие на кнопке "Рейтинг".
 */
// MARK: - GradeDiscountLabel
private struct GradeDiscountLabel: View {

	let labelRating: String
	let labelDiscount: String

	var body: some View {
		HStack(spacing: 0) {
			Button(
				action: {},
				label: {
					HStack(spacing: 2) {
						Image(GlobalImages.IconButtons.iconStar)
							.resizable()
							.scaledToFit()
							.frame(width: 12, height: 12)
							.foregroundColor(FlatColor.BackgroundButton.yellow)
					}

				}
			)
			.frame(width: 16, height: 16)
			Text(labelRating)
				.font(.system(size: 12, weight: .regular))
				.foregroundColor(FlatColor.TextColor.grade)
			Spacer()
			Text(labelDiscount)
				.font(Font.custom(GlobalFonts.CeraRoundPro.bold, size: 16))
				.foregroundColor(FlatColor.TextColor.discount)
		}
		.padding(.horizontal, 5)
	}
}

#if DEBUG
struct CellTileView_Previews: PreviewProvider {
	static var previews: some View {
		let model = MockProduct()
		CellTileView(modelProduct: .constant(model.product))
	}
}
#endif

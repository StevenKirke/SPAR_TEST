//
//  CategoryListCell.swift
//  SPAR-TEST
//
//  Created by Steven Kirke on 06.08.2024.
//

import SwiftUI

// MARK: - CategoryListCell
struct CategoryListCell: View {
	@Binding var modelProduct: CategoryModel.ViewModel.Product
	let width = UIScreen.main.bounds.width

	var body: some View {
		HStack(spacing: 8) {
			CardImageView(
				image: modelProduct.image,
				promotion: modelProduct.promotion,
				discount: modelProduct.discount,
				color: modelProduct.promotionType
			)
			ProductCard(modelProduct: $modelProduct)
		}
		.padding(.horizontal)
		.frame(width: width, height: 176)
		.overlay(
			Rectangle()
				.frame(width: nil, height: 1, alignment: .bottom)
				.foregroundColor(FlatColor.BorderColor.grey), alignment: .bottom)
	}
}

private struct ProductCard: View {

	@Binding var modelProduct: CategoryModel.ViewModel.Product

	var body: some View {
			VStack(alignment: .leading, spacing: 0) {
				HStack(alignment: .top, spacing: 0) {
					VStack(alignment: .leading, spacing: 2) {
						RatingView(rating: modelProduct.rating, countReviews: modelProduct.countReviews)
						Text(modelProduct.productDescription)
							.font(.system(size: 12, weight: .regular))
							.foregroundColor(FlatColor.TextColor.productDescription)
						if !modelProduct.country.title.isEmpty {
							CountryView(country: modelProduct.country)
						}
					}
					OrderLikeButtons(actionShowOrder: {}, actionAddFavorite: {})
				}
				Spacer()
				PriceAndButtonBuy(modelPrice: modelProduct.price)
			}
		.padding(.horizontal, 5)
		.padding(.vertical, 16)
		.frame(alignment: .leading)
	}
}

/**
 Блок рейтинга, для карточки CategoryListCell.
 - Parameters:
		- rating: Рейтинг товара.
		- countReviews?: КОличество отзывов.
 */
// MARK: - GradeDiscountLabel
private struct RatingView: View {

	let rating: String
	let countReviews: String

	var body: some View {
		HStack(spacing: 5) {
			Image(GlobalImages.IconButtons.iconStar)
				.resizable()
				.scaledToFit()
				.frame(width: 12, height: 12)
				.foregroundColor(FlatColor.BackgroundButton.yellow)
			Text(rating)
				.font(.system(size: 12, weight: .regular))
				.foregroundColor(FlatColor.TextColor.grade)
			RoundedRectangle(cornerRadius: 1)
				.fill(Color.gray)
				.frame(width: 2, height: 16)
			Text(countReviews)
				.font(.system(size: 12, weight: .regular))
				.foregroundColor(FlatColor.TextColor.reviews)
			Spacer()
		}
	}
}

private struct CardImageView: View {

	let image: String
	let promotion: String
	let discount: String
	let color: Color

	private let radius = GlobalRadius.Radius.imageCellList.self

	var body: some View {
		ZStack {
			Image(image)
				.resizable()
				.scaledToFit()
			VStack(alignment: .leading, spacing: 0) {
				if !promotion.isEmpty {
					Promotion(text: promotion, color: color)
				}
				Spacer()
				DiscountLabel(labelDiscount: discount)
			}
		}
		.frame(width: 144, height: 144)
		.clipShape(
			.rect(
				topLeadingRadius: radius,
				bottomLeadingRadius: radius,
				bottomTrailingRadius: radius,
				topTrailingRadius: radius
			)
		)
	}
}

// MARK: - GradeDiscountLabel
private struct DiscountLabel: View {

	let labelDiscount: String

	var body: some View {
			Text(labelDiscount)
				.font(Font.custom(GlobalFonts.CeraRoundPro.bold, size: 16))
				.foregroundColor(FlatColor.TextColor.discount)
				.frame(maxWidth: .infinity, alignment: .trailing)
	}
}

#if DEBUG
struct CategoryListCell_Previews: PreviewProvider {
	static var previews: some View {
		let model = MockProduct()
		CategoryListCell(modelProduct: .constant(model.product))
	}
}
#endif

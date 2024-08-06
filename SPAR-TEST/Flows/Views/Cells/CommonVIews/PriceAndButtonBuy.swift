//
//  PriceAndButtonBuy.swift
//  SPAR-TEST
//
//  Created by Steven Kirke on 06.08.2024.
//

import SwiftUI
/**
 Блок цены и кнопка купить, для карточки CellTileView.
 - Parameters:
		- labelRating: Текст отображение рейтинга.
		- discount?: Текст скидка.
		- action: Действие на кнопке "Рейтинг".
 */
// MARK: - PriceAndButtonBuy
struct PriceAndButtonBuy: View {

	let modelPrice: CategoryModel.ViewModel.PriceFull

	var body: some View {
		HStack {
			VStack(alignment: .leading, spacing: 0) {
				TitlePriceView(price: CategoryModel.ViewModel.Price(from: modelPrice))
				Text(modelPrice.priceBeforeDiscount)
					.strikethrough(color: FlatColor.TextColor.priceShare)
					.font(.system(size: 14, weight: .regular))
					.foregroundColor(FlatColor.TextColor.priceShare)
			}
			Spacer()
			Button(
				action: {},
				label: {
					Image(GlobalImages.IconButtons.iconBasket)
						.resizable()
						.scaledToFit()
						.frame(width: 16, height: 16)
						.foregroundColor(.white)
				}
			)
			.padding(.horizontal)
			.padding(.vertical, 10)
			.background(FlatColor.BackgroundButton.green)
			.clipShape(
				RoundedRectangle(cornerRadius: GlobalRadius.Radius.buttonBasket)
			)
		}
	}
}

private struct TitlePriceView: View {

	let price: CategoryModel.ViewModel.Price

	var body: some View {
		HStack(alignment: .center, spacing: 5) {
			HStack(alignment: .top, spacing: 2) {
				Group {
					Text(price.part)
						.font(Font.custom(GlobalFonts.CeraRoundPro.bold, size: 20))
					Text(price.share)
						.font(Font.custom(GlobalFonts.CeraRoundPro.bold, size: 16))
				}
				.foregroundColor(FlatColor.TextColor.price)
				Image(GlobalImages.IconButtons.iconPerAmount)
					.resizable()
					.scaledToFit()
					.frame(width: 20, height: 20)
					.foregroundColor(FlatColor.TextColor.price)

			}
			.foregroundColor(.red)
		}
	}
}

#if DEBUG
struct PriceAndButtonBuy_Previews: PreviewProvider {
	static var previews: some View {
		let model = MockProduct()
		let price = model.product.price
		PriceAndButtonBuy(modelPrice: price)
	}
}
#endif

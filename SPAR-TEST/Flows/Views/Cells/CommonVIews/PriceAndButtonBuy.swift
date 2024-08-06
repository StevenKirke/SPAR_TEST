//
//  PriceAndButtonBuy.swift
//  SPAR-TEST
//
//  Created by Steven Kirke on 06.08.2024.
//

import SwiftUI

struct ChangeBasketToAddProduct: View {

	@State var modelPrice: CategoryModel.ViewModel.PriceFull
	@State var isBasket: Bool = false
	@State var quantity: Int = 0

	var body: some View {
		if isBasket {
			HeaderAddProduct(modelPrice: $modelPrice, quantity: $quantity)
				.onChange(of: quantity) { _, _ in
					if quantity == 0 {
						print("OLOLO")
						self.isBasket = false
					}
				}

		} else {
			PriceAndButtonBuy(
				modelPrice: $modelPrice,
				action: {
					changeBasket()
				}
			)
		}
	}

	private func changeBasket() {
		DispatchQueue.main.async {
			withAnimation(.easeInOut(duration: 0.5)) {
				self.isBasket.toggle()
			}
		}
	}
}

/**
 Блок цены и кнопка купить, для карточки CellTileView.
 - Parameters:
		- labelRating: Текст отображение рейтинга.
		- discount?: Текст скидка.
		- action: Действие на кнопке "Рейтинг".
 */
// MARK: - PriceAndButtonBuy
struct PriceAndButtonBuy: View {

	@Binding var modelPrice: CategoryModel.ViewModel.PriceFull
	let action: () -> Void

	var body: some View {
		HStack(spacing: 0) {
			VStack(alignment: .leading, spacing: 0) {
				TitlePriceView(price: CategoryModel.ViewModel.Price(from: modelPrice))
				Text(modelPrice.priceBeforeDiscount)
					.strikethrough(color: FlatColor.TextColor.priceShare)
					.font(.system(size: 14, weight: .regular))
					.foregroundColor(FlatColor.TextColor.priceShare)
			}
			Spacer()
			Button(
				action: action,
				label: {
					Image(GlobalImages.IconButtons.iconBasket)
						.resizable()
						.scaledToFit()
						.frame(width: 16, height: 16)
						.foregroundColor(.white)
				}
			)
			.padding(.horizontal)
			.frame(height: 36)
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
struct ChangeBasketToAddProduct_Previews: PreviewProvider {
	static var previews: some View {
		let model = MockProduct()
		let price = model.product.price
		ChangeBasketToAddProduct(modelPrice: price)
	}
}
#endif

//
//  HeaderAddProduct.swift
//  SPAR-TEST
//
//  Created by Steven Kirke on 06.08.2024.
//

import SwiftUI

/**
Элемент отображающийся в карточке товара, и содержит блок отображающий единицы измерения товара и цену.
- Включает в себя структуры:
	   - ``TitleAndButton``: Блок отображающий единицы измерения товара.
- Parameters:
	- price: Double Цена.
	- unit: ``Units`` Единицы измерения.
*/
struct HeaderAddProduct: View {

	@Binding var modelPrice: CategoryModel.ViewModel.PriceFull
	@State var unit: Units = .kilogram
	@Binding var quantity: Int

	init(
		modelPrice: Binding<CategoryModel.ViewModel.PriceFull>,
		quantity: Binding<Int>
	) {
		let segmentedControl = UISegmentedControl.appearance()
		segmentedControl.selectedSegmentTintColor = .white
		segmentedControl.setTitleTextAttributes(
			[.foregroundColor: UIColor(.black)],
			for: .selected
		)
		segmentedControl.setTitleTextAttributes(
			[.foregroundColor: UIColor.black.withAlphaComponent(0.5)],
			for: .normal
		)
		self._modelPrice = modelPrice
		self._quantity = quantity
	}

	var body: some View {
		VStack(spacing: 6) {
				Picker("", selection: $unit) {
					ForEach(Units.allCases, id: \.self) { item in
						Text(item.title)
					}
				}
				.tint(Color.red)
				.colorMultiply(Color.white)
				.pickerStyle(SegmentedPickerStyle())
				.frame(height: 28)
			TitleAndButton(modelPrice: $modelPrice, unit: $unit, quantity: $quantity)
		}
	}
}

/**
 Блок отображающий единицы измерения товара .
 - Включает в себя структуры:
		- TitlePrice: Блок отображающий цену продукта.
		- AddButton: Кнопка, увеличения или уменьшения единиц товара.
 - Parameters:
		- price: Double Цена.
		- unit: Units Единицы измерения.
		- quantity: Int Количество единиц товара.
		- totalPrice: String Общая сумма за текущий продукт.
 */
struct TitleAndButton: View {

	@Binding var modelPrice: CategoryModel.ViewModel.PriceFull
	@Binding var unit: Units

	@State var labelTotalPrice: String = ""
	@Binding var quantity: Int {
		didSet {
			var total: Double = 0
			switch quantity {
			case ..<0:
				quantity = 0
			case 1:
				total = modelPrice.priceNumber
			case 2...:
				total = Double(quantity) * modelPrice.priceNumber
			default:
				total = 0
			}
			labelTotalPrice = assemblePrice(number: total)
		}
	}

	var body: some View {
		HStack(spacing: 0) {
			AddButton(title: "-", action: { quantity -= 1 })
			VStack {
				Text("\(quantity) \(unit.title)")
					.font(Font.custom(GlobalFonts.CeraRoundPro.bold, size: 16))
					.foregroundColor(FlatColor.TextColor.quantity)
				Text(labelTotalPrice)
					.font(.system(size: 12, weight: .regular))
					.foregroundColor(FlatColor.TextColor.allPrice)
			}
			.frame(maxWidth: .infinity)
			AddButton(title: "+", action: { quantity += 1 })
		}

		.padding(.horizontal, 10)
		.frame(height: 36)
		.background(FlatColor.BackgroundButton.green)
		.clipShape(
			RoundedRectangle(cornerRadius: GlobalRadius.Radius.buttonBasket)
		)
		.onAppear {
			labelTotalPrice = assemblePrice(number: modelPrice.priceNumber)
		}
	}

	private func assemblePrice(number: Double) -> String {
		let format = String(format: "%.1f", number)
		let assembler = "~\(format) ₽"
		return assembler
	}
}

/**
 Кнопка, увеличения или уменьшения единиц товара.
 - Parameters:
		- title: Название кнопки.
		- action: Действие, при нажатие на кнопку.
 */
private struct AddButton: View {
	let title: String
	var action: () -> Void

	var body: some View {
		Button(action: action) {
			Text(title)
				.font(.system(size: 24, weight: .bold))
				.foregroundColor(FlatColor.TextColor.quantity)
		}
		.padding(.horizontal, 10)
	}
}

#if DEBUG
struct HeaderAddProduct_Previews: PreviewProvider {
	static var previews: some View {
		HeaderAddProduct(modelPrice: .constant(CategoryModel.ViewModel.PriceFull(
			priceNumber: 452.90,
			priceIntegerPart: "452",
			priceShare: "90",
			priceBeforeDiscount: "199.0"
		)), quantity: .constant(0))
	}
}
#endif

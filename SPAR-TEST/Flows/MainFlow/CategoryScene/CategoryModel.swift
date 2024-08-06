//
//  CategoryModel.swift
//  SPAR-TEST
//
//  Created by Steven Kirke on 05.08.2024.
//

import SwiftUI

enum Countries: String {
	case france = "FR"
	case empty = ""

	var title: String {
		var title: String = ""
		switch self {
		case .france:
			title = "Франция"
		case .empty:
			break
		}
		return title
	}

	var flag: String {
		var image: String = ""
		switch self {
		case .france:
			image = "Images/Mocks/IconFrance"
		case .empty:
			break
		}
		return image
	}
}

// swiftlint:disable nesting
enum CategoryModel {
	enum Request {
		case success(Product)
		case failure(Error)

		

		struct Product: Decodable {
			let id: String
			let image: String
			let	productDescription: String
			let promotion: String?
			let promotionType: String?
			let rating: Double
			let countReviews: Int
			let	price: Double
			let discount: Int?
			let	priceBeforeDiscount: Double
			let country: String?
		}
	}

	/// Полученные данные.
	enum Response {
		case success(Products)
		case failure(Error)

		struct Products: Decodable {
			let products: [Product]
		}

		struct Product: Decodable {
			let image: String
			let	productDescription: String
			let promotion: String?
			let promotionType: String?
			let rating: Double
			let countReviews: Int
			let	price: Double
			let discount: Int?
			let	priceBeforeDiscount: Double
			let country: String?
		}

		struct Error {
			/// Текст ошибки.
			let title: String
		}
	}
	/// Данные для View.
	enum ViewModel {
		/// Отображение списка товаров.
		case showVProductList([Product])
		/// Отображение при возникновении ошибки.
		case failure(String)

		struct Product {
			/// ID.
			let id: String
			/// Изображение товара.
			let image: String
			/// Описание товара.
			let productDescription: String
			/// Акция на товар.
			let promotion: String
			/// Тип акции на товар.
			let promotionType: Color
			/// Рейтинг товара.
			let rating: String
			/// Количество отзывов.
			let countReviews: String
			/// Скидка на товара.
			let discount: String
			/// Цена товара.
			var price: PriceFull
			/// Страна изготовитель товара.
			var country: Countries
			/// Понравившийся товара.
			var isFavorite: Bool
			/// Количество выбранного товара.
			var quantity: Int
		}

		struct PriceFull {
			/// Цена товара.
			var priceNumber: Double
			/// Целая часть цены.
			let priceIntegerPart: String
			/// Десятичная часть цены.
			let priceShare: String
			/// Цена после применения скидки.
			let priceBeforeDiscount: String
		}

		struct Price {
			/// Целая часть цены.
			let part: String
			/// Десятичная часть цены.
			let share: String
		}

		struct Error {
			/// Текст ошибки.
			let title: String
			/// Описание ошибки.
			let description: String
		}
	}
}
// swiftlint:enable nesting

extension CategoryModel.ViewModel.Product {
	init(from: CategoryModel.Response.Product, reviews: String) {
		self.init(
			id: UUID().uuidString,
			image: from.image,
			productDescription: from.productDescription,
			promotion: from.promotion ?? "",
			promotionType: Self.disassemblyPromotionType(type: from.promotionType),
			rating: String(from.rating),
			countReviews: reviews,
			discount: Self.checkEmptiness(number: from.discount),
			price: CategoryModel.ViewModel.PriceFull(
				from: from.price,
				priceBeforeDiscount: from.priceBeforeDiscount
			),
			country: Self.assemblyCountry(country: from.country),
			isFavorite: false,
			quantity: 0
		)
	}

	private static func checkEmptiness(number: Int?) -> String {
		guard let currentNumber = number else { return "" }
		let assembler = "\(currentNumber)%"
		return assembler
	}

	private static func disassemblyPromotionType(type: String?) -> Color {
		var currentColor = Color.clear
		guard let currentType = type else { return currentColor }
		switch currentType {
		case "new":
			currentColor = FlatColor.ColorForPromotionType.new
		case "card":
			currentColor = FlatColor.ColorForPromotionType.card
		case "price":
			currentColor = FlatColor.ColorForPromotionType.price
		default:
			break
		}
		return currentColor
	}

	private static func assemblyCountry(country: String?) -> Countries {
		guard let currentCountry = country else { return Countries.empty }
		switch currentCountry {
		case "FR":
			return Countries.france
		default:
			return Countries.empty
		}
	}
}

// MARK: - PriceFull.
extension CategoryModel.ViewModel.PriceFull {
	init(from: Double, priceBeforeDiscount: Double) {
		let disassembly = Self.disassemblePrice(price: from)
		self.init(
			priceNumber: from,
			priceIntegerPart: disassembly.part,
			priceShare: disassembly.share,
			priceBeforeDiscount: String(priceBeforeDiscount)
		)
	}

	private static func disassemblePrice(price: Double) -> (part: String, share: String) {
		let convert = String(price)
		let disassembly = convert.components(separatedBy: ".")
		if disassembly[1] == "0" {
			return (disassembly[0], "")
		} else {
			if disassembly[1].count == 1 {
				let assembly = disassembly[1] + "0"
				return (disassembly[0], assembly)
			}
			return (disassembly[0], disassembly[1])
		}
	}
}

// MARK: - Price.
extension CategoryModel.ViewModel.Price {
	init(from: CategoryModel.ViewModel.PriceFull) {
		self.init(part: from.priceIntegerPart, share: from.priceShare)
	}
}

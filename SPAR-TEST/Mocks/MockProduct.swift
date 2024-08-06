//
//  MockProduct.swift
//  SPAR-TEST
//
//  Created by Steven Kirke on 06.08.2024.
//

import Foundation

/// Карточка с данными товара, для верстки.
final class MockProduct: ObservableObject {
	@Published var product: CategoryModel.ViewModel.Product = CategoryModel.ViewModel.Product(
		image: "Images/Mocks/Card_13",
		productDescription: "сыр Ламбер 500/0 230г",
		promotion: "Удар по ценам",
		promotionType: FlatColor.ColorForPromotionType.price,
		rating: "4.2",
		countReviews: "14 отзывов",
		discount: "25%",
		price: CategoryModel.ViewModel.PriceFull(
			priceNumber: 888.99,
			priceIntegerPart: "888",
			priceShare: "99",
			priceBeforeDiscount: "777.0"
		),
		country: Countries(rawValue: "FR") ?? Countries.empty,
		isFavorite: false
	)
}

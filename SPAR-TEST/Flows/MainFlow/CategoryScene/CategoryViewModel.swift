//
//  CategoryViewModel.swift
//  SPAR-TEST
//
//  Created by Steven Kirke on 05.08.2024.
//

import SwiftUI

protocol ICategoryViewModel: AnyObject {
	/// Получение корректных данных, с последующим отображением в представлении.
	func presentProductList(products: CategoryModel.Response.Products)
	/// Получение ошибки, с последующим отображением в представлении.
	func presentError(error: CategoryModel.Response.Error)
}

final class CategoryViewModel: ObservableObject {
	@Published var	modelForDisplayProducts: [CategoryModel.ViewModel.Product] = []

	// MARK: - Dependencies
	let declinationNumberService: IDeclinationNumberService

	init(declinationNumberService: IDeclinationNumberService) {
		self.declinationNumberService = declinationNumberService
	}
}

extension CategoryViewModel: ICategoryViewModel {
	func presentProductList(products: CategoryModel.Response.Products) {
		convertResponseModel(products: products)
	}

	func presentError(error: CategoryModel.Response.Error) {
		print("Error \(error)")
	}
}

private extension CategoryViewModel {
	func convertResponseModel(products: CategoryModel.Response.Products) {
		self.modelForDisplayProducts = products.products.map {
			let assemblerReviews = declination(reviews: $0.countReviews)
			return CategoryModel.ViewModel.Product(from: $0, reviews: assemblerReviews)
		}
	}

	func declination(reviews: Int) -> String {
		declinationNumberService.declinationNumber(countReviews: reviews).number
	}
}

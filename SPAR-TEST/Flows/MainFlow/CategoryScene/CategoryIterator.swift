//
//  CategoryIterator.swift
//  SPAR-TEST
//
//  Created by Steven Kirke on 05.08.2024.
//

import Foundation

protocol ICategoryIterator: AnyObject {
	func fitchCategoryList()
}

final class CategoryIterator {

	// MARK: - Dependencies
	let viewModel: ICategoryViewModel!
	var worker: ICategoryWorker

	// MARK: - Private properties
	// Файл с данными.
	private let fileName = "MockProductList"

	internal init(viewModel: ICategoryViewModel, worker: ICategoryWorker) {
		self.viewModel = viewModel
		self.worker = worker
	}
}

extension CategoryIterator: ICategoryIterator {
	func fitchCategoryList() {
		self.worker.getDataProducts(resourceFile: fileName) { resultProductList in
			switch resultProductList {
			case .success(let productList):
				self.viewModel.presentProductList(products: productList)
			case .failure(let error):
				let model = CategoryModel.Response.Error(title: error.localizedDescription)
				self.viewModel.presentError(error: model)
			}
		}
	}
}

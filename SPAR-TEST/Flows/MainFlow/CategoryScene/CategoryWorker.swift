//
//  CategoryWorker.swift
//  SPAR-TEST
//
//  Created by Steven Kirke on 06.08.2024.
//

import Foundation

/// Псевдоним возврата модели, содержит массив товаров, или ошибку.
typealias ResultProductList = (Result<CategoryModel.Response.Products, Error>) -> Void?

protocol ICategoryWorker: AnyObject {
	/// Метод получения списка товаров.
	func getDataProducts(resourceFile: String, completion: @escaping ResultProductList)
}

final class CategoryWorker: ICategoryWorker {

	// MARK: - Dependencies
	let fileManager: ILoadFileManager
	let decodeJSONManager: IDecodeJsonManager

	// MARK: - Initializator
	internal init(
		fileManager: ILoadFileManager,
		decodeJSONManager: IDecodeJsonManager
	) {
		self.fileManager = fileManager
		self.decodeJSONManager = decodeJSONManager
	}

	// MARK: - Private methods
	// Запрос на список товаров.
	func getDataProducts(resourceFile: String, completion: @escaping ResultProductList) {
		fileManager.getFile(resource: resourceFile, type: .json, response: { data in
			switch data {
			case .success(let currentData):
				self.decode(data: currentData, model: CategoryModel.Response.Products.self) { resultDecode in
					switch resultDecode {
					case .success(let json):
						completion(.success(json))
					case .failure(let error):
						completion(.failure(error))
					}
				}
			case .failure(let error):
					completion(.failure(error))
			}
		})
	}
}

// MARK: - Decode JSON
private extension CategoryWorker {
	// Декодирование полученной Data.
	func decode<T: Decodable>(data: Data, model: T.Type, resultJSON: @escaping (Result<T, DecodeError>) -> Void) {
		decodeJSONManager.decodeJSON(data: data, model: model, returnJSON: { json in
			switch json {
			case .success(let currentJSON):
				resultJSON(.success(currentJSON))
			case .failure(let error):
				resultJSON(.failure(error))
			}
		})
	}
}

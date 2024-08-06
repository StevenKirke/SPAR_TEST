//
//  AssemblerCategoryScene.swift
//  SPAR-TEST
//
//  Created by Steven Kirke on 05.08.2024.
//

import SwiftUI

final class AssemblerCategoryScene {
	// MARK: - Public methods
	func configurator() -> some View {
		// MARK: Managers.
		// Менеджер работы с файлами.
		let fileManager = LoadFileManager()
		// Менеджер работы с JSON.
		let jsonManager = DecodeJsonManager()

		// MARK: Services.
		let declinationNumberService = DeclinationNumberService()

		// MARK: Workers.
		let worker = CategoryWorker(fileManager: fileManager, decodeJSONManager: jsonManager)

		// MARK: VIP.
		let viewModel = CategoryViewModel(declinationNumberService: declinationNumberService)
		let iterator = CategoryIterator(viewModel: viewModel, worker: worker)

		var viewController = CategoryView(viewModel: viewModel)

		viewController.iterator = iterator
		iterator.fitchCategoryList()

		return viewController
	}
}

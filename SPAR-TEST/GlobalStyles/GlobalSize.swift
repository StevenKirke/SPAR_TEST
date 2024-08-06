//
//  GlobalSize.swift
//  SPAR-TEST
//
//  Created by Steven Kirke on 05.08.2024.
//

import Foundation

enum GlobalSize {
	enum Size {
		/// Размер кнопок, верхнего меню.
		static let menuBotton: CGSize = CGSize(width: 40, height: 40)
	}
}

enum GlobalRadius {
	enum Radius {
		/// Радиус кнопки "Корзина", 40.
		static let buttonBasket: CGFloat = 40
		/// Радиус картинки для ячейки CategoryListCell, 8.
		static let imageCellList: CGFloat = 8
		/// Радиус карточки, с малым и большим радиусом, 16, 20.
		static let cellTile: (littleRadius: CGFloat, bitRadius: CGFloat) = (16, 20)
		/// Радиус плашки акции, для ячейки CellTileView.
		static let promotionPlate: (littleRadius: CGFloat, bitRadius: CGFloat) = (0, 6)
	}
}

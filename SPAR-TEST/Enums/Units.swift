//
//  Units.swift
//  SPAR-TEST
//
//  Created by Steven Kirke on 05.08.2024.
//

import Foundation

/// Перечисление, описывающие единицы товара.
enum Units: Int, CaseIterable {
	/// Штука
	case thing
	/// Килограмм
	case kilogram

	/// Название.
	var title: String {
		var title: String = ""
		switch self {
		case .thing:
			title = "Шт"
		case .kilogram:
			title = "Кг"
		}
		return title
	}
}

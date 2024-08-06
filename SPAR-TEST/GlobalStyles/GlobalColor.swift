//
//  GlobalColor.swift
//  SPAR-TEST
//
//  Created by Steven Kirke on 05.08.2024.
//

import SwiftUI

enum FlatColor {
	enum BackgroundColor {
		static let light = Color(hex: "ffffff")
		static let black = Color(hex: "000000")
		static let promotionPlate = Color(hex: "7A79BA")
	}

	enum ButtonIconColor {
		static let green = Color(hex: "#15B783")
	}

	enum BackgroundButton {
		static let grey = Color(hex: "#F5F5F5")
		static let yellow = Color(hex: "#FAD656")
		static let white = Color(hex: "FFFFFF")
		static let blackFourty = Color(hex: "000000").opacity(0.4)
		static let green = Color(hex: "15B742")
	}

	enum BorderColor {
		static let grey = Color(hex: "CBCBCB")
	}

	enum TextColor {
		static let price = Color(hex: "262626")
		static let priceShare = Color(hex: "262626").opacity(0.6)
		static let grade = Color(hex: "000000")
		static let discount = Color(hex: "C32323")
		static let productDescription = Color(hex: "262626").opacity(0.8)
		static let promotion = Color(hex: "FFFFFF")
		static let reviews = Color(hex: "262626")
		static let country = Color(hex: "262626").opacity(0.6)
		static let allPrice = Color(hex: "FFFFFF").opacity(0.8)
		static let quantity = Color(hex: "FFFFFF")
		static let pickerActive = Color(hex: "262626")
		static let pickerNoActive = Color(hex: "262626").opacity(0.6)
	}

	enum ColorForPromotionType {
		static let new = Color(hex: "7A79BA").opacity(0.9)
		static let card = Color(hex: "5BCD7B").opacity(0.9)
		static let price = Color(hex: "FC6A6F").opacity(0.9)
	}

	enum ColorPicker {
		static let selected = Color(hex: "FFFFFF")
		static let card = Color(hex: "5BCD7B").opacity(0.9)
		static let price = Color(hex: "FC6A6F").opacity(0.9)
	}

	enum ShadowColor {
		static let grey = Color(hex: "8B8B8B")
	}
}

struct Setting {
	let color: Color
	let opacity: Float
	let radius: CGFloat
	let size: CGSize
}

enum Shadow {
	/// opacity: 0.2, radius: 8, size 0X0, color: black 8B8B8B.
	static let shadowCell = Setting(
		color: FlatColor.ShadowColor.grey,
		opacity: 0.2,
		radius: 8,
		size: CGSize(width: 0, height: 0)
	)
}

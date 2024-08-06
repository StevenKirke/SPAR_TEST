//
//  DeclinationNumberService.swift
//  SPAR-TEST
//
//  Created by Steven Kirke on 06.08.2024.
//

import Foundation

struct Declination {
	let number: String
	let isDeclination: Bool
}

protocol IDeclinationNumberService {
	func declinationNumber(countReviews: Int) -> Declination
}

final class DeclinationNumberService {
	func declination(reviews: Int) -> Declination {
		declinationNumber(countReviews: reviews)
	}
}
extension DeclinationNumberService: IDeclinationNumberService {
	func declinationNumber(countReviews: Int) -> Declination {
		var assembler: Declination = Declination(number: "", isDeclination: false)
			let number = countReviews % 100
			if number >= 11 && number <= 19 {
				assembler = Reviews.review(countReviews).declination
			} else {
				let present = number % 10
				switch present {
				case 1:
					assembler = Reviews.review(countReviews).declination
				case 2, 3, 4:
					assembler = Reviews.reviews(countReviews).declination
				default:
					assembler = Reviews.review(countReviews).declination
				}
			}
		return assembler
	}

	private enum Reviews {
		case review(Int)
		case reviews(Int)

		var declination: Declination {
			var declination = Declination(number: "", isDeclination: false)
			switch self {
			case .review(let count):
				declination = Declination(number: "\(count) отзывов", isDeclination: false)
			case .reviews(let count):
				declination = Declination(number: "\(count) отзывa", isDeclination: true)
			}
			return declination
		}
	}
}

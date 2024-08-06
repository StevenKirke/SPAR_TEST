//
//  CategoryView.swift
//  SPAR-TEST
//
//  Created by Steven Kirke on 05.08.2024.
//

import SwiftUI

struct CategoryView: View {

	// MARK: - Dependencies
	@ObservedObject var viewModel: CategoryViewModel
	var iterator: ICategoryIterator?
	let globalImage = GlobalImages.IconButtons.self

	@State var gridItems = [
		GridItem(.flexible(), spacing: 0),
		GridItem(.flexible(), spacing: 0)
	]

	@State var imageButton: String  = "Images/Icons/IconList"

	@State var isList = false {
		 didSet {
			if isList {
				gridItems = [GridItem(.flexible(), spacing: 0)]
				imageButton = globalImage.iconList
		   } else {
			   gridItems = [
				GridItem(.flexible(), spacing: 0),
				GridItem(.flexible(), spacing: 0)
			   ]
			   imageButton = globalImage.iconTile
		   }
		}
	}

	var body: some View {

		ZStack {
			BackgroundView()
			VStack(spacing: .zero) {
				ButtonMenu(image: imageButton, action: {
					self.isList.toggle()
				})
				ScrollView(.vertical, showsIndicators: false) {
					LazyVGrid(columns: gridItems) {
						ForEach(viewModel.modelForDisplayProducts.indices, id: \.self) { index in
							if isList {
								CategoryListCell(modelProduct: $viewModel.modelForDisplayProducts[index])
							} else {
								CellTileView(modelProduct: $viewModel.modelForDisplayProducts[index])
							}
						}
					}
					.padding(.horizontal)
				}
			}
		}
	}
}

private struct ButtonMenu: View {

	// MARK: - Public properties
	let image: String
	let action: () -> Void

	// MARK: - Private properties
	private let sizeIcon = GlobalSize.Size.self
	private let colorStyle = FlatColor.self

	var body: some View {
		HStack(spacing: 0) {
			Button(
				action: action,
				label: {
					Image(image)
						.resizable()
						.scaledToFit()
						.foregroundColor(colorStyle.ButtonIconColor.green)
				}
			)
			.frame(width: sizeIcon.menuBotton.width, height: sizeIcon.menuBotton.height)
			.background(colorStyle.BackgroundButton.grey)
			.cornerRadius(12)
			Spacer()
		}
		.padding(.bottom, 2)
		.padding(.leading, 8)
		.overlay(
			Rectangle()
				.frame(width: nil, height: 1, alignment: .bottom)
				.foregroundColor(colorStyle.BorderColor.grey), alignment: .bottom)
		.frame(maxHeight: 44)
	}
}

#if DEBUG
struct CategoryView_Previews: PreviewProvider {
	static var previews: some View {
		CategoryView(viewModel: CategoryViewModel(declinationNumberService: DeclinationNumberService()))
	}
}
#endif

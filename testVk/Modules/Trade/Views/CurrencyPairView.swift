//
//  CurrencyPairView.swift
//  testVk
//
//  Created by Enzhe Gaysina on 06.04.2024.
//

import SwiftUI

struct CurrencyPairView: View {
    
    @Binding var selectedCell: CurrencyPairModels
    var items: [CurrencyPairModels]
    @Environment(\.presentationMode) var presentationMode
    
    // MARK: - Body
    
    var body: some View {
	   ZStack {
		  Color.theme.tradeBackground
			 .edgesIgnoringSafeArea(.all)
		  ScrollView {
			 VStack(spacing: .zero) {
				HStack {
				    Button(action: {
					   self.presentationMode.wrappedValue.dismiss()
				    }) {
					   Image(Constants.imageText)
						  .resizable()
						  .foregroundColor(Color.theme.textHeader)
						  .frame(width: Constants.arrowWidth,
							    height: Constants.arrowHeight
						  )
						  .rotationEffect(Angle(degrees: Constants.arrowRotation))
				    }
				    Spacer()
				    Text(Constants.currencyPairText)
					   .foregroundColor(Color.theme.textHeader)
					   .font(.inter(.bold, size: Constants.textSize))
				    Spacer()
				}
				.padding(.leading, Constants.leadingPadding)
				.padding(.bottom, Constants.bottomPadding)
				.padding(.top, Constants.topPadding)
				
				LazyVGrid(columns: Constants.gridColumns, spacing: Constants.gridSpacing) {
				    ForEach(items, id: \.self) { item in
					   Text(item.name)
						  .font(.inter(.semibold, size: Constants.gridTextSize))
						  .padding(Constants.gridPadding)
						  .frame(height: Constants.gridItemHeight)
						  .frame(maxWidth: .infinity)
						  .background(
							 RoundedRectangle(cornerRadius: Constants.cornerRadius)
								.fill(selectedCell == item ?
									 Color.theme.selectedTab : Color.theme.rectangle)
						  )
						  .foregroundColor(Color.theme.textHeader)
						  .onTapGesture {
							 selectedCell = item
						  }
				    }
				}
				.padding(.horizontal, Constants.gridHorizontalPadding)
			 }
		  }
	   }
	   .navigationBarHidden(true)
    }
}

// MARK: - Constants

fileprivate extension CurrencyPairView {
    enum Constants {
	   static let arrowWidth: CGFloat = 24
	   static let arrowHeight: CGFloat = 24
	   static let arrowRotation: Double = 180
	   static let imageText: String = "arrowRight"
	   static let currencyPairText: String = "Currency pair"
	   static let textSize: CGFloat = 22
	   static let leadingPadding: CGFloat = 9
	   static let bottomPadding: CGFloat = 36
	   static let topPadding: CGFloat = 20
	   static let gridSpacing: CGFloat = 18
	   static let gridTextSize: CGFloat = 14
	   static let gridPadding: CGFloat = 10
	   static let gridItemHeight: CGFloat = 54
	   static let gridHorizontalPadding: CGFloat = 37
	   static let cornerRadius: CGFloat = 12
	   static let gridColumns: [GridItem] = [
		  GridItem(.flexible(), spacing: gridSpacing),
		  GridItem(.flexible())
	   ]
    }
}

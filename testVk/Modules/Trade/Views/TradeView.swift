//
//  TradeView.swift
//  testVk
//
//  Created by Enzhe Gaysina on 06.04.2024.
//

import SwiftUI

struct TradeView: View {
    @StateObject var viewModel: TradeViewModel = TradeViewModel()
    
    //MARK: - body TradeView
    var body: some View {
	   NavigationView {
		  ZStack {
			 Color.theme.tradeBackground
				.edgesIgnoringSafeArea(.all)
			 ScrollView(.vertical, showsIndicators: false) {
				
				VStack(spacing: Constants.innerVerticalSpacing) {
				    Text(Constants.tradeTitle)
					   .font(.inter(.bold, size: Constants.titleFontSize))
					   .foregroundColor(Color.theme.textHeader)
					   .padding(.bottom, Constants.titlePaddingBottom)
					   .padding(.top, Constants.outerPaddingTop)
				    
				    Rectangle()
					   .overlay(
						  VStack(spacing: Constants.innerVerticalSpacing) {
							 Text(Constants.balanceTitle)
								.font(.inter(.regular, size: Constants.balanceTitleFontSize))
								.foregroundColor(Color.theme.textHeaderRectangle)
								.padding(.bottom, Constants.balanceTitlePaddingBottom)
							 Text(Constants.initialBalance)
								.font(.inter(.semibold, size: Constants.initialBalanceFontSize))
								.foregroundColor(Color.theme.textHeader)
						  }
					   )
					   .frame(width: Constants.balanceFrameWidth,
							height: Constants.balanceFrameHeight
					   )
					   .foregroundColor(Color.theme.rectangle)
					   .cornerRadius(Constants.cornerRadius)
				    
				    WebView(url: URL(string: viewModel.selectedCell.url))
					   .frame(height: Constants.webViewHeight)
					   .padding(.top, Constants.webViewPaddingTop)
					   .padding(.bottom, Constants.webViewPaddingBottom)
				    
				    NavigationLink(destination: CurrencyPairView(selectedCell: $viewModel.selectedCell,
													    items: viewModel.currencyPairs)) {
					   ZStack {
						  Text(viewModel.selectedCell.name)
							 .foregroundColor(Color.theme.textHeader)
							 .font(.inter(.bold, size: Constants.currencyPairFontSize))
						  
						  HStack {
							 Spacer()
							 Image(Constants.arrowRightImage)
								.resizable()
								.frame(width: Constants.arrowRightImageSize,
									  height: Constants.arrowRightImageSize)
								.padding(.trailing, Constants.arrowRightImageTrailingPadding)
						  }
					   }
					   .frame(width: Constants.currencyPairFrameWidth,
							height: Constants.currencyPairFrameHeight)
					   .background(RoundedRectangle(cornerRadius: Constants.cornerRadius).fill(Color.theme.rectangle))
				    }
				    
				    HStack(spacing: Constants.innerSpacing) {
					   TimerView()
					   InvestmentView()
				    }
				    .padding(.vertical, Constants.innerPaddingVertical)
				    .padding(.horizontal,Constants.horizontalButtonPadding)
				    
				    HStack(spacing: Constants.innerSpacing) {
					   CustomButton(text: Constants.sellButtonText,
								 color: Color.theme.buttonRed)
					   CustomButton(text: Constants.buyButtonText,
								 color: Color.theme.buttonGreen)
				    }
				    .padding(.horizontal,Constants.horizontalButtonPadding)
				    .padding(.bottom, Constants.outerPaddingBottom)
				}
			 }
		  }
		  .navigationBarHidden(true)
		  .keyboardResponsive()
		  .edgesIgnoringSafeArea(.all)
		  .onTapGesture {
			 UIApplication.shared.endEditing()
		  }
	   }
    }
}

// MARK: - Constants

fileprivate extension TradeView {
    enum Constants {
	   static let verticalSpacing: CGFloat = .zero
	   static let innerVerticalSpacing: CGFloat = 7
	   static let tradeTitle = "Trade"
	   static let titleFontSize: CGFloat = 22
	   static let titlePaddingBottom: CGFloat = 15
	   static let balanceTitle = "Balance"
	   static let balanceTitleFontSize: CGFloat = 12
	   static let balanceTitlePaddingBottom: CGFloat = 7
	   static let initialBalance = "10 000"
	   static let initialBalanceFontSize: CGFloat = 16
	   static let balanceFrameWidth: CGFloat = UIScreen.main.bounds.width - 60
	   static let balanceFrameHeight: CGFloat = 54
	   static let cornerRadius: CGFloat = 12
	   static let webViewHeight: CGFloat = UIScreen.main.bounds.height / 3
	   static let webViewPaddingTop: CGFloat = 25
	   static let webViewPaddingBottom: CGFloat = 16
	   static let currencyPairFontSize: CGFloat = 16
	   static let currencyPairFrameWidth: CGFloat = UIScreen.main.bounds.width - 60
	   static let currencyPairFrameHeight: CGFloat = 54
	   static let arrowRightImage = "arrowRight"
	   static let arrowRightImageSize: CGFloat = 24
	   static let arrowRightImageTrailingPadding: CGFloat = 11
	   static let innerSpacing: CGFloat = 11
	   static let innerPaddingVertical: CGFloat = 10
	   static let sellButtonText = "Sell"
	   static let buyButtonText = "Buy"
	   static let outerPaddingBottom: CGFloat = 2
	   static let outerPaddingTop: CGFloat = UIScreen.main.bounds.height / 18
	   static let horizontalButtonPadding: CGFloat = 30
    }
}

//
//  InvestmentView.swift
//  testVk
//
//  Created by Enzhe Gaysina on 06.04.2024.
//

import SwiftUI

struct InvestmentView: View {
    @StateObject private var investmentViewModel = InvestmentViewModel()
    
    //MARK: - body InvestmentView
    var body: some View {
	   Rectangle()
		  .overlay(
			 VStack(spacing: Constants.verticalSpacing) {
				Text(Constants.investmentTitle)
				    .font(.inter(.regular, size: Constants.titleFontSize))
				    .foregroundColor(Color.theme.textHeaderRectangle)
				
				HStack {
				    Button(action: {
					   investmentViewModel.decreaseAmount()
				    }) {
					   Image(Constants.minusImage)
						  .resizable()
						  .frame(width: Constants.buttonImageSize,
							    height: Constants.buttonImageSize
						  )
				    }
				    .padding(.leading, Constants.leadingPadding)
				    
				    TextField("", text: Binding<String>(
					   get: { String(investmentViewModel.amount) },
					   set: { newValue in
						  if let intValue = Int(newValue) {
							 investmentViewModel.amount = intValue
						  }
					   }
				    ))
				    .font(.inter(.semibold, size: Constants.textFieldFontSize))
				    .foregroundColor(Color.theme.textHeader)
				    .multilineTextAlignment(.center)
				    .keyboardType(.numberPad)
				    .onChange(of: investmentViewModel.amount) { newValue in
					   if newValue > Constants.maxAmount {
						  investmentViewModel.amount = Constants.maxAmount
					   }
				    }
				    
				    Button(action: {
					   investmentViewModel.increaseAmount()
				    }) {
					   Image(Constants.addImage)
						  .resizable()
						  .frame(width: Constants.buttonImageSize,
							    height: Constants.buttonImageSize
						  )
				    }
				    .padding(.trailing, Constants.trailingPadding)
				}
			 }
		  )
		  .frame(width: Constants.frameWidth, height: Constants.frameHeight)
		  .foregroundColor(Color.theme.rectangle)
		  .cornerRadius(Constants.cornerRadius)
    }
}

// MARK: - Constants

fileprivate extension InvestmentView {
    enum Constants {
	   static let minusImage = "minus"
	   static let addImage = "plus"
	   static let investmentTitle = "Investment"
	   static let verticalSpacing: CGFloat = 7
	   static let titleFontSize: CGFloat = 12
	   static let buttonImageSize: CGFloat = 15
	   static let leadingPadding: CGFloat = 16.44
	   static let textFieldFontSize: CGFloat = 16
	   static let trailingPadding: CGFloat = 16.5
	   static let maxAmount: Int = 999999
	   static let frameWidth: CGFloat = 152
	   static let frameHeight: CGFloat = 54
	   static let cornerRadius: CGFloat = 12
    }
}

//
//  CustomButton.swift
//  testVk
//
//  Created by Enzhe Gaysina on 06.04.2024.
//

import SwiftUI

struct CustomButton: View {
    var text: String
    var color: Color
    
    var body: some View {
	   Button(action: {}) {
		  Text(text)
			 .font(.inter(.bold, size: Constants.textSize))
			 .foregroundColor(Color.theme.textHeader)
			 .padding(.trailing, Constants.trailingPadding)
			 .padding(.top, Constants.topPadding)
			 .padding(.bottom, Constants.bottomPadding)
	   }
	   .frame(width: Constants.buttonWidth, height: Constants.buttonHeight)
	   .background(color)
	   .cornerRadius(Constants.cornerRadius)
    }
}

// MARK: - Constants

fileprivate extension CustomButton {
    enum Constants {
	   static let textSize: CGFloat = 24
	   static let trailingPadding: CGFloat = 90
	   static let topPadding: CGFloat = 8
	   static let bottomPadding: CGFloat = 17
	   static let buttonWidth: CGFloat = 152
	   static let buttonHeight: CGFloat = 54
	   static let cornerRadius: CGFloat = 12
    }
}

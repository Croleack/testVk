//
//  TimerView.swift
//  testVk
//
//  Created by Enzhe Gaysina on 06.04.2024.
//

import SwiftUI

struct TimerView: View {
    @StateObject var timerViewModel = TimerViewModel()
    
    //MARK: - body TimerView
    var body: some View {
	   Rectangle()
		  .overlay(
			 VStack(spacing: Constants.verticalSpacing) {
				Text(Constants.timerTitle)
				    .font(.inter(.regular, size: Constants.titleFontSize))
				    .foregroundColor(Color.theme.textHeaderRectangle)
				
				HStack {
				    Button(action: {
					   timerViewModel.decreaseTime()
				    }) {
					   Image(Constants.minusImage)
						  .resizable()
						  .frame(width: Constants.buttonImageSize,
							    height: Constants.buttonImageSize
						  )
				    }
				    .padding(.leading, Constants.leadingPadding)
				    
				    TextField("", text: Binding<String>(
					   get: { timerViewModel.formattedTime() },
					   set: { newValue in timerViewModel.parseTime(from: newValue) }
				    ), onEditingChanged: { editing in
					   if !editing {
						  timerViewModel.parseTime(from: timerViewModel.formattedTime())
					   }
				    })
				    .font(.inter(.semibold, size: Constants.textFieldFontSize))
				    .foregroundColor(Color.theme.textHeader)
				    .multilineTextAlignment(.center)
				    .keyboardType(.numberPad)
				    
				    Button(action: {
					   timerViewModel.increaseTime()
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

fileprivate extension TimerView {
    enum Constants {
	   static let timerTitle = "Timer"
	   static let verticalSpacing: CGFloat = 7
	   static let titleFontSize: CGFloat = 12
	   static let minusImage = "minus"
	   static let buttonImageSize: CGFloat = 15
	   static let leadingPadding: CGFloat = 16.44
	   static let textFieldFontSize: CGFloat = 16
	   static let addImage = "plus"
	   static let trailingPadding: CGFloat = 16.5
	   static let frameWidth: CGFloat = 152
	   static let frameHeight: CGFloat = 54
	   static let cornerRadius: CGFloat = 12
    }
}

//
//  LoaderView.swift
//  testVk
//
//  Created by Enzhe Gaysina on 06.04.2024.
//

import SwiftUI

struct LoaderView: View {
    let progressBar: CGFloat
    
    var body: some View {
	   ZStack(alignment: .leading) {
		  Rectangle()
			 .frame(width: Constants.barWidth,
				   height: Constants.barHeight)
			 .foregroundColor(Color.theme.noLoaded)
			 .cornerRadius(Constants.cornerRadius)
		  
		  Rectangle()
			 .frame(width: (progressBar / 100 * Constants.barWidth),
				   height: Constants.barHeight)
			 .foregroundColor(Color.theme.loaded)
			 .cornerRadius(Constants.cornerRadius)
	   }
	   .overlay(
		  HStack {
			 Spacer()
			 Text("\(Int(progressBar))%")
				.font(.inter(.semibold, size: Constants.textFontSize))
				.foregroundColor(Color.theme.textHeader)
			 Spacer()
		  }
	   )
    }
}

// MARK: - Constants

fileprivate extension LoaderView {
    enum Constants {
	   static let barWidth: CGFloat = UIScreen.main.bounds.width - 76
	   static let barHeight: CGFloat = 24
	   static let cornerRadius: CGFloat = 12
	   static let textFontSize: CGFloat = 16
    }
}

//
//  TopViewCell.swift
//  testVk
//
//  Created by Enzhe Gaysina on 06.04.2024.
//

import SwiftUI

struct TopViewCell: View {
    
    let trade: TopModel
    let rank: Int
    
    //MARK: - body TopViewCell
    var body: some View {
	   HStack(spacing: Constants.horizontalSpacing) {
		  Text("\(rank)")
			 .font(.inter(.regular, size: Constants.rankFontSize))
			 .foregroundColor(Color.theme.textRank)
			 .frame(minWidth: Constants.rankMinWidth,
				   alignment: .leading
			 )
			 .padding(.leading, Constants.rankLeadingPadding)
		  
		  Text(trade.country)
			 .frame(minWidth: Constants.countryMinWidth,
				   alignment: .leading
			 )
			 .padding(.leading, Constants.countryLeadingPadding)
		  
		  Text(trade.name)
			 .font(.inter(.regular, size: Constants.nameFontSize))
			 .foregroundColor(Color.theme.textHeader)
			 .frame(minWidth: Constants.nameMinWidth)
		  
		  Text("$\(trade.deposit)")
			 .font(.inter(.regular, size: Constants.depositFontSize))
			 .foregroundColor(Color.theme.textHeader)
			 .frame(minWidth: Constants.depositMinWidth,
				   alignment: .trailing
			 )
		  
		  Text("$\(trade.profit)")
			 .font(.inter(.regular, size: Constants.profitFontSize))
			 .frame(minWidth: Constants.profitMinWidth,
				   alignment: .trailing
			 )
			 .padding(.leading, Constants.profitLeadingPadding)
			 .padding(.trailing, Constants.profitTrailingPadding)
			 .foregroundColor(trade.profit >= .zero ?
						   Color.theme.textProfit : Color.theme.textProfitMinus)
	   }
    }
}

// MARK: - Constants

fileprivate extension TopViewCell {
    enum Constants {
	   static let horizontalSpacing: CGFloat = .zero
	   static let rankFontSize: CGFloat = 14
	   static let rankMinWidth: CGFloat = 28.43
	   static let rankLeadingPadding: CGFloat = 20.75
	   static let countryMinWidth: CGFloat = 61.24
	   static let countryLeadingPadding: CGFloat = 4.37
	   static let nameFontSize: CGFloat = 14
	   static let nameMinWidth: CGFloat = 67.8
	   static let depositFontSize: CGFloat = 14
	   static let depositMinWidth: CGFloat = 61.24
	   static let profitFontSize: CGFloat = 14
	   static let profitMinWidth: CGFloat = 74.36
	   static let profitLeadingPadding: CGFloat = 14.21
	   static let profitTrailingPadding: CGFloat = 8.19
    }
}

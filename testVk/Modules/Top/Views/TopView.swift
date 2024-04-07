//
//  TopView.swift
//  testVk
//
//  Created by Enzhe Gaysina on 06.04.2024.
//

import SwiftUI

struct TopView: View {
    @ObservedObject var viewModel: TopViewModel
    
    init() {
	   let traders: [TopModel] = [
		  TopModel(rank: 1, country: "🇰🇷", name: "아크말", deposit: 200, profit: 2000),
		  TopModel(rank: 2, country: "🇯🇵", name: "アクマル", deposit: 200, profit: 800),
		  TopModel(rank: 3, country: "🇹🇹", name: "اڪمل", deposit: 200, profit: 400),
		  TopModel(rank: 4, country: "🇺🇦", name: "Акмаль", deposit: 300, profit: 350),
		  TopModel(rank: 5, country: "🇹🇨", name: "Akmal", deposit: 300, profit: -100),
		  TopModel(rank: 6, country: "🇹🇲", name: "አክማል", deposit: 900, profit: -500),
		  TopModel(rank: 7, country: "🇫🇯", name: "अकमल", deposit: 900, profit: -600),
		  TopModel(rank: 8, country: "🇸🇷", name: "Jessi", deposit: 300, profit: -700),
		  TopModel(rank: 9, country: "🇹🇷", name: "Walter", deposit: 200, profit: -800),
		  TopModel(rank: 10, country: "🇨🇬", name: "White", deposit: 150, profit: -900)
	   ]
	   
	   self.viewModel = TopViewModel(traders: traders)
    }
    //MARK: - body TopView
    
    var body: some View {
	   ZStack {
		  Color.theme.topBackground
			 .edgesIgnoringSafeArea(.top)
		  
		  VStack(spacing: Constants.verticalSpacing) {
			 Text(Constants.titleLabel)
				.font(.inter(.bold, size: Constants.titleFontSize))
				.foregroundColor(Color.theme.textHeader)
				.padding(.top, Constants.titleTopPadding)
				.padding(.bottom, Constants.titleBottomPadding)
			 List {
				HStack {
				    Text(Constants.rankLabel)
					   .frame(minWidth: Constants.rankMinWidth,
							alignment: .leading
					   )
					   .padding(.leading, Constants.rankLeadingPadding)
				    Text(Constants.countryLabel)
					   .frame(minWidth: Constants.countryMinWidth,
							alignment: .leading
					   )
					   .padding(.leading, Constants.countryLeadingPadding)
				    Text(Constants.nameLabel)
					   .frame(minWidth: Constants.nameMinWidth)
				    Text(Constants.depositLabel)
					   .frame(minWidth: Constants.depositMinWidth,
							alignment: .trailing
					   )
				    Text(Constants.profitLabel)
					   .frame(minWidth: Constants.profitMinWidth,
							alignment: .trailing
					   )
					   .padding(.trailing, Constants.profitTrailingPadding)
				}
				.font(.inter(.regular, size: Constants.headerFontSize))
				.cornerRadius(Constants.headerCornerRadius)
				.foregroundColor(Color.theme.textRank)
				.listRowBackground(Color.theme.listCellHeader)
				.padding(.horizontal, Constants.headerHorizontalPadding)
				
				ForEach(viewModel.traders.indices, id: \.self) { index in
				    let trade = viewModel.traders[index]
				    TopViewCell(trade: trade, rank: index + 1)
					   .listRowBackground(index % 2 == 0 ?
									  Color.theme.listOddCell : Color.theme.listCellHeader)
				}
			 }
			 .listStyle(PlainListStyle())
		  }
	   }
    }
}

// MARK: - Constants

fileprivate extension TopView {
    enum Constants {
	   static let verticalSpacing: CGFloat = .zero
	   static let titleLabel: String = "TOP 10 Traders"
	   static let titleFontSize: CGFloat = 22
	   static let titleTopPadding: CGFloat = 20
	   static let titleBottomPadding: CGFloat = 29
	   static let rankLabel: String = "№"
	   static let rankMinWidth: CGFloat = 18.59
	   static let rankLeadingPadding: CGFloat = 20.75
	   static let countryLabel: String = "Country"
	   static let countryMinWidth: CGFloat = 61.24
	   static let countryLeadingPadding: CGFloat = 14.22
	   static let nameLabel: String = "Name"
	   static let nameMinWidth: CGFloat = 67.8
	   static let depositLabel: String = "Deposit"
	   static let depositMinWidth: CGFloat = 73.26
	   static let profitLabel: String = "Profit"
	   static let profitMinWidth: CGFloat = 53.21
	   static let profitTrailingPadding: CGFloat = 20.19
	   static let headerFontSize: CGFloat = 12
	   static let headerCornerRadius: CGFloat = 4
	   static let headerHorizontalPadding: CGFloat = 12
    }
}

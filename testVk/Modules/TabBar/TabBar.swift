//
//  TabBar.swift
//  testVk
//
//  Created by Enzhe Gaysina on 06.04.2024.
//

import SwiftUI

struct TabBar: View {
    
    init() {
	   UITabBar.appearance().backgroundColor = UIColor(Color.theme.tabBarBackground)
	   UITabBar.appearance().unselectedItemTintColor = UIColor(Color.theme.noSelectedTab)
    }
    //MARK: - body TabBar
    var body: some View {
	   TabView {
		  Group {
			 tabItem(for: TradeView(),
				    image: Constants.imageFirst,
				    text: Constants.textFirst
			 )
			 tabItem(for: TopView(),
				    image: Constants.imageSecond,
				    text: Constants.textSecond
			 )
		  }
	   }
	   .accentColor(Color.theme.selectedTab)
    }
    
    private func tabItem<T: View>(for content: T, image: String,text: String) -> some View {
	   content
		  .tabItem {
			 Image(image)
				.renderingMode(.template)
				.foregroundColor(Color.theme.selectedTab)
			 Text(text)
				.font(.inter(.regular, size: Constants.fontText))
		  }
    }
}

// MARK: - Constants

fileprivate extension TabBar {
    enum Constants {
	   static let imageFirst = "iconTrade"
	   static let textFirst = "Trade"
	   static let imageSecond = "iconTop"
	   static let textSecond = "Top"
	   static let fontText = 10.0
    }
}

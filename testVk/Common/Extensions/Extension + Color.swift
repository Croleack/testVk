//
//  Extension + Color.swift
//  testVk
//
//  Created by Enzhe Gaysina on 06.04.2024.
//

import SwiftUI
///the color scheme can be improved to support different modes.
extension Color {
    
    static let theme = ColorTheme()
}

struct ColorTheme {
    
    let loaded = Color("loaded")
    let noLoaded = Color("noLoaded")
    let loadingFigures = Color("loadingFigures")
    let topBackground = Color("topBackground")
    let tradeBackground = Color("tradeBackground")
    let tabBarBackground = Color("tabBarBackground")
    let selectedTab = Color("selectedTab")
    let noSelectedTab = Color("noSelctedTab")
    let strokeTab = Color("strokeTab")
    let listCellHeader = Color("listCellHeader")
    let listOddCell = Color("listOddCell")
    let rectangle = Color("rectangle")
    let buttonRed = Color("buttomRed")
    let buttonGreen = Color("buttomGreen")
    let divider = Color("divider")
    
    let textHeader = Color("textHeader")
    let textRank = Color("textRank")
    let textProfit = Color("textProfit")
    let textProfitMinus = Color("textProfitMinus")
    let textHeaderRectangle = Color("textHeaderRectangle")
}

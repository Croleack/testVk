//
//  TradeViewModel.swift
//  testVk
//
//  Created by Enzhe Gaysina on 06.04.2024.
//

import Foundation

class TradeViewModel: ObservableObject {
    @Published var currencyPairs: [CurrencyPairModels] = []
    @Published var selectedCell: CurrencyPairModels
    
    init() {
	   currencyPairs = CurrencyPairModels.shared
	   selectedCell = CurrencyPairModels.shared[0]
    }
    
}

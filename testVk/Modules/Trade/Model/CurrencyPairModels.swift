//
//  CurrencyPairModels.swift
//  testVk
//
//  Created by Enzhe Gaysina on 06.04.2024.
//

import Foundation

struct CurrencyPairModels: Hashable {
    var id: UUID
    var name: String
    var url: String
    
    static var shared: [CurrencyPairModels] {
	   let names = ["GPB/USD", "EUR/USD"]
	   let urls = [
		  "https://www.tradingview.com/chart/?symbol=NASDAQ%3AGBP",
		  "https://www.tradingview.com/chart/?symbol=BMFBOVESPA%3AEUR1%21"
	   ]
	   
	   var pairs: [CurrencyPairModels] = []
	   for i in 0..<14 {
		  let index = i % 2
		  pairs.append(CurrencyPairModels(id: UUID(), name: names[index], url: urls[index]))
	   }
	   
	   return pairs
    }
}

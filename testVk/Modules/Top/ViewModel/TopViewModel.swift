//
//  TopViewModel.swift
//  testVk
//
//  Created by Enzhe Gaysina on 06.04.2024.
//

import SwiftUI

class TopViewModel: ObservableObject {
    @Published var traders: [TopModel]
    
    init(traders: [TopModel]) {
	   self.traders = traders
	   startUpdatingProfits()
    }
    
    func startUpdatingProfits() {
	   Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { timer in
		  self.updateProfits()
		  self.sortTradersByProfit()
	   }
    }
    
    func updateProfits() {
	   for index in 0..<traders.count {
		  let randomProfitChange = Int.random(in: -150...50)
		  traders[index].profit += randomProfitChange
	   }
    }
    
    func sortTradersByProfit() {
	   traders.sort { $0.profit > $1.profit }
    }
}

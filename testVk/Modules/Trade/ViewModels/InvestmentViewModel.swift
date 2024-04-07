//
//  InvestmentViewModel.swift
//  testVk
//
//  Created by Enzhe Gaysina on 06.04.2024.
//

import SwiftUI

class InvestmentViewModel: ObservableObject {
    @Published var amount: Int = 1000
    ///we don't allow a negative number
    func decreaseAmount() {
	   if amount > 0 {
		  amount -= 100
	   }
    }
    
    func increaseAmount() {
	   amount += 100
    }
}

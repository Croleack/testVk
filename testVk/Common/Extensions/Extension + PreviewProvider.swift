//
//  Extension + PreviewProvider.swift
//  testVk
//
//  Created by Enzhe Gaysina on 06.04.2024.
//

import SwiftUI
///created to work with preview
extension PreviewProvider {
    
    static var dev: DeveloperPreview {
	   return DeveloperPreview.instance
    }
}

class DeveloperPreview {
    
    static let instance = DeveloperPreview()
    
    private init() {}
    
    let trade = TopModel(rank: 1, country: "🇰🇷", name: "Jun", deposit: 236, profit: -500)
}

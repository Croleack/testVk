//
//  testVkApp.swift
//  testVk
//
//  Created by Enzhe Gaysina on 06.04.2024.
//

import SwiftUI

@main
struct ExchangeInstrumentsApp: App {
    @StateObject private var launchViewModel = LaunchViewModel()
    
    var body: some Scene {
	   WindowGroup {
		  ZStack {
			 TabBar()
			 if launchViewModel.showLaunchView {
				LaunchView(showLaunchView: $launchViewModel.showLaunchView)
				    .transition(.move(edge: .leading))
			 }
		  }
	   }
    }
}

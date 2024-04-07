//
//  LaunchView.swift
//  testVk
//
//  Created by Enzhe Gaysina on 06.04.2024.
//

import SwiftUI

struct LaunchView: View {
    @StateObject private var launchViewModel = LaunchViewModel()
    @Binding var showLaunchView: Bool
    private let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    //MARK: - body LaunchView
    var body: some View {
	   ZStack {
		  Image("background")
			 .resizable()
			 .edgesIgnoringSafeArea(.all)
		  if launchViewModel.showLoader {
			 LoaderView(progressBar: launchViewModel.progressBar)
		  }
	   }
	   .onReceive(timer) { _ in
		  launchViewModel.updateProgress()
		  if launchViewModel.isLaunchCompleted {
			 showLaunchView = false
		  }
	   }
    }
}

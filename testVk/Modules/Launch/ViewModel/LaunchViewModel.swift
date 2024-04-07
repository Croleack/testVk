//
//  LaunchViewModel.swift
//  testVk
//
//  Created by Enzhe Gaysina on 06.04.2024.
//

import Foundation
import UserNotifications

class LaunchViewModel: ObservableObject {
    @Published var progressBar: CGFloat = 0
    @Published var showLoader: Bool = true
    @Published var loops: Int = 0
    @Published var showLaunchView = true
    
    init() {
	   requestNotificationAuthorization()
    }
    
    private let completionThreshold: CGFloat = 100
    private let progressIncrement: CGFloat = 0.5
    private let maxLoops: Int = 1
    
    var isLaunchCompleted: Bool {
	   return loops >= maxLoops
    }
    
    func updateProgress() {
	   if progressBar < completionThreshold {
		  progressBar += progressIncrement
	   } else {
		  showLoader = false
		  loops += 1
	   }
    }
    
    private func requestNotificationAuthorization() {
	   UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
		  if success {
			 print("Пользователь красава")
		  } else if let error = error {
			 print("Увы: \(error.localizedDescription)")
		  }
	   }
    }
}

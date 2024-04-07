//
//  TimerViewModel.swift
//  testVk
//
//  Created by Enzhe Gaysina on 06.04.2024.
//

import Foundation

class TimerViewModel: ObservableObject {
    @Published var minutes: Int = 0
    @Published var seconds: Int = 0
    
    func decreaseTime() {
	   if seconds == 0 {
		  if minutes > 0 {
			 minutes -= 1
			 seconds = 59
		  }
	   } else {
		  seconds -= 1
	   }
    }
    
    func increaseTime() {
	   if seconds == 59 {
		  minutes += 1
		  seconds = 0
	   } else {
		  seconds += 1
	   }
    }
    
    func parseTime(from string: String) {
	   let components = string.components(separatedBy: ":")
	   guard components.count == 2,
		    let newMinutes = Int(components[0]),
		    let newSeconds = Int(components[1]),
		    newMinutes >= 0, newSeconds >= 0, newSeconds < 60 else {
		  return
	   }
	   
	   minutes = newMinutes
	   seconds = newSeconds
    }
    
    func formattedTime() -> String {
	   return String(format: "%02d:%02d", minutes, seconds)
    }
}

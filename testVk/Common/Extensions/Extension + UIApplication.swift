//
//  Extension + UIApplication.swift
//  testVk
//
//  Created by Enzhe Gaysina on 06.04.2024.
//

import SwiftUI
///remove the keyboard from the screen
extension UIApplication {
    func endEditing() {
	   sendAction(#selector(UIResponder.resignFirstResponder),
			    to: nil,
			    from: nil,
			    for: nil)
    }
}

//
//  Extension + View.swift
//  testVk
//
//  Created by Enzhe Gaysina on 06.04.2024.
//

import SwiftUI
///it looks better this way
extension View {
    func keyboardResponsive() -> ModifiedContent <Self, Keyboard> {
	   return modifier(Keyboard())
    }
}

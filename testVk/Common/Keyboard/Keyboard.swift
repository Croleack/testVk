//
//  Keyboard.swift
//  testVk
//
//  Created by Enzhe Gaysina on 06.04.2024.
//

import SwiftUI
///allows you to move content up by the keyboard size
struct Keyboard: ViewModifier {
    @State var offset: CGFloat = .zero
    
    func body(content: Content) -> some View {
	   content.padding(.bottom, offset)
		  .onAppear {
			 NotificationCenter.default.addObserver(
				forName: UIResponder.keyboardWillShowNotification,
				object: nil,
				queue: .main) { (notification) in
				    let value = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
				    let height = value.height
				    
				    self.offset = height
				}
			 NotificationCenter.default.addObserver(
				forName: UIResponder.keyboardWillHideNotification,
				object: nil,
				queue: .main) { (notification) in
				    
				    self.offset = .zero
				}
		  }
    }
}

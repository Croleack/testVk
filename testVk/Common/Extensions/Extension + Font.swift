//
//  Extension + Font.swift
//  testVk
//
//  Created by Enzhe Gaysina on 06.04.2024.
//

import SwiftUI

extension Font {
    enum InterType {
	   case regular
	   case bold
	   case semibold
    }
    
    ///Parameters:
    ///type: Font type - Inter.
    ///size: Font size.
    static func inter(_ type: InterType, size: CGFloat) -> Font {
	   guard let fontName = fontName(for: type) else {
		  return Font.system(size: size)
	   }
	   return .custom(fontName, size: size)
    }
    
    private static func fontName(for type: InterType) -> String? {
	   switch type {
	   case .semibold:
		  return "Inter-SemiBold"
	   case .bold:
		  return "Inter-Bold"
	   case .regular:
		  return "Inter-Regular"
	   }
    }
}

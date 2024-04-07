//
//  WebView.swift
//  testVk
//
//  Created by Enzhe Gaysina on 06.04.2024.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    
    let url: URL?
    
    func makeUIView(context: Context) -> WKWebView {
	   let prefs = WKWebpagePreferences()
	   prefs.allowsContentJavaScript = true
	   let config = WKWebViewConfiguration()
	   config.defaultWebpagePreferences = prefs
	   return WKWebView(frame: .zero,
					configuration: config)
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
	   guard let scheduleURL = url else {
		  return
	   }
	   let request = URLRequest(url: scheduleURL)
	   uiView.load(request)
    }
}

//
//  WebView.swift
//  MobileUpSwiftApp
//
//  Created by Радэль Зубаиров on 14.08.2024.
//

import SwiftUI

import WebKit

struct WebView: UIViewRepresentable {
    let appID = "52141721"
    @Binding var token: String
    
    func makeUIView(context: Context) -> WKWebView  {
        let wkwebView = WKWebView()
        wkwebView.navigationDelegate = context.coordinator
        
        var urlComponent = URLComponents()
        urlComponent.scheme = "https"
        urlComponent.host = "oauth.vk.com"
        urlComponent.path = "/authorize"
        
        urlComponent.queryItems = [
        URLQueryItem(name: "client_id", value: appID),
        URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
        URLQueryItem(name: "display", value: "mobile"),
        URLQueryItem(name: "response_type", value: "token"),
        ]
        
        let request = URLRequest(url: urlComponent.url!)
        wkwebView.load(request)
        return wkwebView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
    }
    
    func makeCoordinator() -> WebViewCooordinator {
        WebViewCooordinator{ token in
            self.token = token
        }
    }
}

class WebViewCooordinator: NSObject, WKNavigationDelegate{
    
    var token: (String) -> ()
    
    init(token: @escaping (String) -> Void) {
        self.token = token
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        
        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment =
                url.fragment else {
            decisionHandler(.allow)
            return
        }
        
        let params = fragment.components(separatedBy: "&")
            .map{$0.components(separatedBy: "=")}
            .reduce([String: String]()) { res, param in
                var dict = res
                let key = param[0]
                let value = param[1]
                dict[key] = value
                
                return dict
            }
        
        if let token = params["access_token"] {
            self.token(token)
        }
        
        decisionHandler(.cancel)
    }
}


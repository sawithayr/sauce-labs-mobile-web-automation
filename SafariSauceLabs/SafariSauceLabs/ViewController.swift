//
//  ViewController.swift
//  SafariSauceLabs
//
//  Created by Sawitha Yuliana Rinaldy on 10/03/24.
//

//import WebKit
//import UIKit
//
//final class ViewController:UIViewController {
//    
//    private let webView: WKWebView = {
//        let prefs = WKPreferences()
//        prefs.javaScriptEnabled = true
//        let pagePrefs = WKWebpagePreferences()
//        pagePrefs.allowsContentJavaScript = true
//        let config = WKWebViewConfiguration()
//        config.preferences = prefs
//        config.defaultWebpagePreferences = pagePrefs
//        let webview = WKWebView(frame: .zero, configuration: config)
//        return webview
//    }()
//    
//    override func viewDidLoad(){
//        super.viewDidLoad()
//        guard let url = URL(string: "https://www.saucedemo.com/") else {return}
//        view.addSubview(webView)
//        webView.navigationDelegate = self
//        webView.load(URLRequest(url: url))
//        NSLayoutConstraint.activate([
//            webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            webView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
//            webView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
//            webView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
//        ])
//    }
    
//    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!){
//        webView.evaluateJavaScript(<#T##javaScriptString: String##String#>), completion
//    }
//}

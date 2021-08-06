//
//  ViewController.swift
//  wkwebview
//
//  Created by Afrar Malakooth on 6/5/20.
//

import UIKit
import WebKit
import Foundation
import AVFoundation


class WebViewController: UIViewController, WKNavigationDelegate {
  
    var webView: WKWebView!
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view .addSubview(<#T##view: UIView##UIView#>)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://sorfeh.com")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }
}


//
//  ViewController.swift
//  Internet
//
//  Created by Kotaev Ruslan on 18.01.2021.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var forwardButton: UIButton!
    @IBOutlet weak var urlTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        urlTextField.delegate = self
        
        let homePage = "https://yandex.ru"
        let url = URL(string: homePage)
        let request = URLRequest(url: url!)
        
        urlTextField.text = homePage
        webView.navigationDelegate = self
        
        webView.load(request)
        webView.allowsBackForwardNavigationGestures = true
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
    @IBAction func forwardButtonAction(_ sender: Any) {
        if webView.canGoForward {
            webView.goForward()
        }
    }
    
}

extension ViewController: UITextFieldDelegate, WKNavigationDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        let urlString = textField.text!
        let url = URL(string:  urlString)!
        let request = URLRequest(url: url)
        
        webView.load(request)
        
        textField.resignFirstResponder()
        return true
    }
    
   func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
    urlTextField.text = webView.url?.absoluteString
    
    backButton.isEnabled = webView.canGoBack
    forwardButton.isEnabled = webView.canGoForward
    }
}

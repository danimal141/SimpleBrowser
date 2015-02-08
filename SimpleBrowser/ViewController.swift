//
//  ViewController.swift
//  SimpleBrowser
//
//  Created by Hideaki Ishii on 2015/02/08.
//  Copyright (c) 2015年 danimal141. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var backBtn: UIBarButtonItem!
    @IBOutlet weak var forwardBtn: UIBarButtonItem!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.webView.delegate = self
        
        let startUrl = "http://www.yahoo.co.jp/"
        if let url = NSURL(string: startUrl) {
            let urlRequest = NSURLRequest(URL: url)
            self.webView.loadRequest(urlRequest)
        }
        self.activityIndicatorView.hidesWhenStopped = true
        self.setupBtnsEnabled()
    }
    
    func setupBtnsEnabled() {
        self.backBtn.enabled = self.webView.canGoBack
        self.forwardBtn.enabled = self.webView.canGoForward
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
        self.activityIndicatorView.startAnimating()
    }

    func webViewDidFinishLoad(webView: UIWebView) {
        self.activityIndicatorView.stopAnimating()
        self.setupBtnsEnabled()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goBack(sender: AnyObject) {
        self.webView.goBack()
    }
    @IBAction func goForward(sender: AnyObject) {
        self.webView.goForward()
    }
    @IBAction func reload(sender: AnyObject) {
        self.webView.reload()
    }
}
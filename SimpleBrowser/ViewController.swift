//
//  ViewController.swift
//  SimpleBrowser
//
//  Created by Hideaki Ishii on 02/08/15.
//  Copyright (c) 2015 danimal141. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var backBtn: UIBarButtonItem!
    @IBOutlet weak var forwardBtn: UIBarButtonItem!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.webView.delegate = self
        self.textField.delegate = self
        
        let startUrl = "http://www.yahoo.co.jp/" // Sample url
        
        self.accessUrl(startUrl)
        self.activityIndicatorView.hidesWhenStopped = true
        self.setupBtnsEnabled()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
        self.activityIndicatorView.startAnimating()
    }

    func webViewDidFinishLoad(webView: UIWebView) {
        self.activityIndicatorView.stopAnimating()
        self.setupBtnsEnabled()
        self.updateUrlLocation()
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError) {
        self.webView.stopLoading()
        self.activityIndicatorView.stopAnimating()
        
        if error.code != NSURLErrorCancelled {
            self.showAlert("Network Error")
        }
        self.updateUrlLocation()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        var urlString = self.textField.text
        urlString = urlString.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        if urlString == "" {
            self.showAlert("Enter URL")
        } else {
            self.accessUrl(urlString)
            self.setupBtnsEnabled()
        }
        self.textField.resignFirstResponder()
        return true
    }
    
    func accessUrl(urlString: String) {
        if let url = NSURL(string: urlString) {
            let urlRequest = NSURLRequest(URL: url)
            self.webView.loadRequest(urlRequest)
        } else {
            self.showAlert("Invalid URL")
        }
    }
    
    func updateUrlLocation() {
        if let urlString = self.webView.request?.URL.absoluteString {
            self.textField.text = urlString
        }
    }
    
    func setupBtnsEnabled() {
        self.backBtn.enabled = self.webView.canGoBack
        self.forwardBtn.enabled = self.webView.canGoForward
    }
    
    func showAlert(msg: String) {
        let alertController = UIAlertController(title: "Error", message: msg, preferredStyle: .Alert)
        let dafaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alertController.addAction(dafaultAction)
        self.presentViewController(alertController, animated: true, completion: nil)
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
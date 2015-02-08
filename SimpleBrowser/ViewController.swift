//
//  ViewController.swift
//  SimpleBrowser
//
//  Created by Hideaki Ishii on 2015/02/08.
//  Copyright (c) 2015年 danimal141. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var backBtn: UIBarButtonItem!
    @IBOutlet weak var forwardBtn: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let startUrl = "http://www.yahoo.co.jp/"
        if let url = NSURL(string: startUrl) {
            let urlRequest = NSURLRequest(URL: url)
            self.webView.loadRequest(urlRequest)
        }
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
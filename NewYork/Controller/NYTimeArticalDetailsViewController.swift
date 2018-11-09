//
//  NYTimeArticalDetailsViewController.swift
//  NewYork
//
//  Created by Upendra Nimmala on 09/11/18.
//  Copyright © 2018 Upendra Nimmala. All rights reserved.
//

import UIKit

class NYTimeArticalDetailsViewController: UIViewController,UIWebViewDelegate {
    let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.whiteLarge)
    @IBOutlet weak var webView: UIWebView!
    var articalDetailsurl : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.delegate = self
        self.showActivityIndicator()
        print(articalDetailsurl!)
        let url = URL (string: articalDetailsurl!)
        let requestObj = URLRequest(url: url!)
        webView.loadRequest(requestObj)
        self.activityIndicator.stopAnimating()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showActivityIndicator() {
        activityIndicator.center = CGPoint(x: self.view.bounds.size.width/2, y: self.view.bounds.size.height/2)
        activityIndicator.color = UIColor.gray
        activityIndicator.startAnimating()
        self.view.addSubview(activityIndicator)
    }
    
    internal func webViewDidStartLoad(_ webView: UIWebView) {
        activityIndicator.startAnimating()
    }
    
    internal func webView(_ webView: UIWebView, didFailLoadWithError error: Error)
    {
        print(error)
        activityIndicator.stopAnimating()
        
    }
    
    internal   func webViewDidFinishLoad(_ webView: UIWebView)
    {
        activityIndicator.stopAnimating()
    }
}

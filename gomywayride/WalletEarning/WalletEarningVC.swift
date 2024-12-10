//
//  WalletEarningVC.swift
//  GomywayCanada
//
//  Created by meet sharma on 07/08/23.
//  Copyright © 2023 Snow-Macmini-1. All rights reserved.
//

import UIKit
import WebKit

class WalletEarningVC: UIViewController,WKNavigationDelegate {

    @IBOutlet weak var webVw: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        if  UserDefaults.standard.string(forKey: "selectLanguage") == "es" {
            self.title = "walletEarning".localizeString(string: "es")
           
        }else{
            self.title = "walletEarning".localizeString(string: "en")
        
           
        }
      
         webVw.navigationDelegate = self

        if let url = URL(string: "https://gomywayusa.com/api/Apidata/get-wallet-listing?token=\(fethToken())") {
                    let request = URLRequest(url: url)
                    webVw.load(request)
                }
    }
    
    
    //MARK:- WKWebDelegate
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        
        showProgressHud(view: self.view)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        dissmissHUD(self.view)
    }
    
   

}

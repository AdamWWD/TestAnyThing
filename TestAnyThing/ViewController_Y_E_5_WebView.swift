//
//  ViewController_Y_E_5_WebView.swift
//  TestAnyThing
//
//  Created by adamwang on 2017/8/30.
//  Copyright © 2017年 adamwang. All rights reserved.
//

import UIKit

class ViewController_Y_E_5_WebView: UIViewController, UIWebViewDelegate {

    
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var label: UILabel!
    
    
    @IBAction func onClick(_ sender: Any) {
        if let ret = webView.stringByEvaluatingJavaScript(from: "window.appCall('hello')"){
            print(ret)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let url = Bundle.main.url(forResource: "demo", withExtension: "html")
        webView.loadRequest(URLRequest(url: url!))
    }
    
    var dict = [String: String]()
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        if request.url?.absoluteString.range(of:"dummy") != nil{
            if let data = request.httpBody{
                if let string = String(data: data, encoding: .utf8)
                {
                    // t1 = 123 & t2 = 456
                    for p in string.components(separatedBy: "&")
                    {
                        let arr = string.components(separatedBy: "=")
                        dict[arr[0]] = arr[1]
                    }
                    
                    label.text = dict["t1"]
                }
            }
            return false
        }
        
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

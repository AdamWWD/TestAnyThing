//
//  ViewController13_6.swift
//  TestAnyThing
//
//  Created by adamwang on 2017/6/14.
//  Copyright © 2017年 adamwang. All rights reserved.
//

import UIKit

class ViewController13_6: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let url = NSURL(string: "http://abc.com/index.jsp")
        let request = NSMutableURLRequest(url:url! as URL)
        let submitContent = "x=10&y=30"
        request.httpMethod = "POST"
        request.httpBody = submitContent.data(using: String.Encoding.utf8, allowLossyConversion: true)
        
        
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

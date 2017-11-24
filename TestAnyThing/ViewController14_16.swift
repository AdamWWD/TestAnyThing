//
//  ViewController14_16.swift
//  TestAnyThing
//
//  Created by adamwang on 2017/6/9.
//  Copyright © 2017年 adamwang. All rights reserved.
//

import UIKit

class ViewController14_16: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // 利用餘數來限定範圍, %100後的範圍為0~99, +1後則為1~100
        
        for _ in 0 ..< 100
        {
            let n:UInt32 = arc4random() % 100 + 1;
            NSLog("%u", n)
        }
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

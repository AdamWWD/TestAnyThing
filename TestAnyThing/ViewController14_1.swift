//
//  ViewController14_1.swift
//  TestAnyThing
//
//  Created by adamwang on 2017/6/9.
//  Copyright © 2017年 adamwang. All rights reserved.
//

import UIKit

class ViewController14_1: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        let app = UIApplication.shared.delegate as! AppDelegate
        
        NSLog("%d", app.add(x: 5, value: 3))
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

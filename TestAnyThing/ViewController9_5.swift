//
//  ViewController9_5.swift
//  TestAnyThing
//
//  Created by adamwang on 2017/6/15.
//  Copyright © 2017年 adamwang. All rights reserved.
//

import UIKit

class ViewController9_5: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        if (event?.subtype == UIEventSubtype.motionShake)
        {
            NSLog("搖晃中")
        }
    }

    override var canBecomeFirstResponder: Bool{return true}
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

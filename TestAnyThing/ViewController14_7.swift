//
//  ViewController14_7.swift
//  TestAnyThing
//
//  Created by adamwang on 2017/6/9.
//  Copyright © 2017年 adamwang. All rights reserved.
//

import UIKit

class ViewController14_7: UIViewController, SampleDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let sc:SampleClass14_7 = SampleClass14_7()
        sc.delegate = self
        sc.doSomething()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func finish(sampleClass: SampleClass14_7) {
        NSLog("done")
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

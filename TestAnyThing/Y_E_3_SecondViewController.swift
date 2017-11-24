//
//  Y_E_3_SecondViewController.swift
//  TestAnyThing
//
//  Created by adamwang on 2017/8/27.
//  Copyright © 2017年 adamwang. All rights reserved.
//

import UIKit

class Y_E_3_SecondViewController: UIViewController {
    
    var str: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func exitClick(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func onClick(_ sender: Any) {
        if let str = str
        {
            print(str)
            self.str = "echo 'hello world'"
        }
        
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

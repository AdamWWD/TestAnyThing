//
//  ViewController_Y_E_3_Segue_Next_View.swift
//  TestAnyThing
//
//  Created by adamwang on 2017/8/27.
//  Copyright © 2017年 adamwang. All rights reserved.
//

import UIKit

class ViewController_Y_E_3_Segue_Next_View: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segue_vc_to_secondvc"
        {
            let vc = segue.destination as? Y_E_3_SecondViewController
            vc?.str = "hello world"
        }
        
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        if segue.identifier == "unwind_secondvc_to_vc" {
            let vc = segue.source as? Y_E_3_SecondViewController
            if let str = vc?.str {
                print(str)
            }
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

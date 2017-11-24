//
//  ViewController_Y_E_8_SecondVC.swift
//  TestAnyThing
//
//  Created by adamwang on 2017/9/1.
//  Copyright © 2017年 adamwang. All rights reserved.
//

import UIKit

class ViewController_Y_E_8_SecondVC: UIViewController {

    
    @IBOutlet weak var label: UILabel!
    var str:String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        label.text = str
    }
    
    @IBAction func exitButtonClick(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
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

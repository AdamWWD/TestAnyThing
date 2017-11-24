//
//  ViewController_7_1.swift
//  TestAnyThing
//
//  Created by adamwang on 2017/7/20.
//  Copyright © 2017年 adamwang. All rights reserved.
//

import UIKit
import MapKit

class ViewController_7_1: UIViewController {

    let lm = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lm.requestWhenInUseAuthorization()
        
        
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

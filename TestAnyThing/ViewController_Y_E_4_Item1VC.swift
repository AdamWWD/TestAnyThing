//
//  ViewController_Y_E_4_Item1VC.swift
//  TestAnyThing
//
//  Created by adamwang on 2017/8/29.
//  Copyright © 2017年 adamwang. All rights reserved.
//

import UIKit

class ViewController_Y_E_4_Item1VC: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func menuClick(_ sender: Any) {
        navigationController?.view.menu()
    }

    @IBAction func handleEdgePanGesture(_ sender: UIScreenEdgePanGestureRecognizer) {
        let location = sender.location(in: nil)
        navigationController?.view.slideByFinger(location: location, state: sender.state)
        
    }
    
    @IBAction func handleTapGesture(_ sender: Any) {
        navigationController?.view.menu()
    
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

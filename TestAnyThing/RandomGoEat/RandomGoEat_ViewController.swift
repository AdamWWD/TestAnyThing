//
//  RandomGoEat_ViewController.swift
//  TestAnyThing
//
//  Created by adamwang on 2017/10/18.
//  Copyright © 2017年 adamwang. All rights reserved.
//

import UIKit

class RandomGoEat_ViewController: UIViewController {
    
    let arrRandomEat = ["鍋燒意麵","炒飯","大滷麵","牛肉麵", "排骨便當", "肯德基"]
    @IBOutlet weak var labelShowResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func Go(_ sender: Any) {
        let randNum = arc4random_uniform(UInt32(arrRandomEat.count))
        labelShowResult.text = arrRandomEat[Int(randNum)]
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

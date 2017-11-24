//
//  ViewController13_4.swift
//  TestAnyThing
//
//  Created by adamwang on 2017/6/14.
//  Copyright © 2017年 adamwang. All rights reserved.
//

import UIKit

class ViewController13_4: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        // 1.讀取JSON字串
        let path = Bundle.main.path(forResource: "json", ofType: "txt")
        let data = NSData(contentsOfFile: path!)
        
        // 2.解析JSON字串
        let jsonObj:NSArray = try! JSONSerialization.jsonObject(with: data! as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSArray
        
        // 3.利用迴圈印出解析後的結果
        
        for p in jsonObj {
           let tel = (p as AnyObject).object(forKey: "電話") as! NSDictionary
           let name = (p as AnyObject).object(forKey: "姓名") as! NSString
           let age = (p as AnyObject).object(forKey: "年齡") as! NSInteger
           let tel_o = tel.object(forKey: "公司") as! NSString
           let tel_h = tel.object(forKey: "住家") as! NSString
           
           NSLog("%@(%d)/TEL(O):%@, TEL(H):%@", name, age, tel_o, tel_h);
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

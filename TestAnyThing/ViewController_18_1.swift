//
//  ViewController_18_1.swift
//  TestAnyThing
//
//  Created by adamwang on 2017/8/4.
//  Copyright © 2017年 adamwang. All rights reserved.
//

import UIKit

class ViewController_18_1: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // 取得已經複製到家目錄下Documents資料夾中的Property List_18_1.plist路徑
        let path = NSHomeDirectory() + "/Documents/Property List_18_1.plist"
        if let plist = NSMutableDictionary(contentsOfFile: path)
        {
            // 將Color資料讀出
            if let color = plist["Color"]
            {
                print("The color is \(color)")
            }
            
            // 修改Color資料
            plist["Color"] = "Green"
            if plist.write(toFile: path, atomically: true){
                print("修改顏色成功")
                if let color = plist["Color"]
                {
                    print("The color is \(color)")
                }
            }
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

//
//  ViewController11_1.swift
//  TestAnyThing
//
//  Created by adamwang on 2017/6/16.
//  Copyright © 2017年 adamwang. All rights reserved.
//

import UIKit

class ViewController11_1: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var fm = FileManager.default
        var dir = NSHomeDirectory().appending("/Documents/data")
        var file = dir.appending("/mydata.txt")
        var err:NSErrorPointer = nil
        
        // 在 Documents 下建立 data 目錄
        do{
            try fm.createDirectory(atPath: dir, withIntermediateDirectories: true, attributes: nil)
        } catch{
            print("建立dir1目錄失敗")
        }
    
        
//        if (success)
//        {
//            NSLog("目錄建立成功")
//        }
//        else
//        {
//            NSLog("目錄建立失敗")
//        }
//        
//        // 在 data 目錄下建立 mydata.txt 檔案
//        success = fm.createFile(atPath: file, contents: nil, attributes: nil)
//        
//        if (success)
//        {
//            NSLog("檔案建立成功")
//        }
//        else
//        {
//            NSLog("檔案建立失敗")
//        }
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

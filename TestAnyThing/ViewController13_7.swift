//
//  ViewController13_7.swift
//  TestAnyThing
//
//  Created by adamwang on 2017/6/14.
//  Copyright © 2017年 adamwang. All rights reserved.
//

import UIKit
import Social

class ViewController13_7: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // 先測試行動裝置內的Facebook設定是否完成
        if (SLComposeViewController.isAvailable(forServiceType: SLServiceTypeFacebook))
        {
            // 輸入資料的畫面使用系統內建的
            var social = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            
            // 要上傳的文字
            social?.setInitialText("App PO文測試\n")
            
            // 要上傳的網址
            var url = URL(string: "http://www.google.com.tw")
            social?.add(url)
            
            // 要上傳的圖片
            var img = UIImage(named: "sample.jpg")
            social?.add(img)
            
            // 開啟輸入資料畫面
            self.present(social!, animated: true, completion: {NSLog("資料送到Facebook成功")})
            
            
            
            
        
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

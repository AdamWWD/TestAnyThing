//
//  ViewController13_2.swift
//  TestAnyThing
//
//  Created by adamwang on 2017/6/12.
//  Copyright © 2017年 adamwang. All rights reserved.
//

import UIKit

class ViewController13_2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // 設定圖片的網址
        var url = URL(string: "http://pic.pimg.tw/vcdlkkvcdlkk/4bb9a89f23fb8_n.jpg")
        var request = URLRequest(url: url!)
        
        // set up the session
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        var response:URLResponse?
        var error:NSErrorPointer = nil
    
        let task =  session.dataTask(with: request, completionHandler: { (data, response, error) in
            // do stuff with response, data & error here
            print(error)
            print(response)
            
            if (error == nil)
            {
                if ((data?.count)! > 0 && error == nil)
                {
                    var img = UIImage(data: data!)
                    NSLog("圖片下載完畢,大小為%@ x %@", img!.size.width, img!.size.height)
                }
            }
            else
            {
                NSLog("Download url error %@", error as! String)
            }
        })
        task.resume()
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

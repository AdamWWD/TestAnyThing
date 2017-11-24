//
//  ViewController_7_11.swift
//  TestAnyThing
//
//  Created by adamwang on 2017/7/25.
//  Copyright © 2017年 adamwang. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController_7_11: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // 這個位置是台北故宮的座標
        let location = CLLocation(latitude: 25.102645, longitude: 121.548506)
        let geocoder = CLGeocoder()
        
        // 將座標轉換成地址
        geocoder.reverseGeocodeLocation(location){(placemarks, error) in
            guard error == nil else {
                return
            }
            
            guard placemarks != nil else {
                return
            }
            
            for placemark in placemarks! {
                let addressDict = placemark.addressDictionary
                
                for key in (addressDict?.keys)!{
                    let value = addressDict?[key]
                    
                    // 有時候value是NSArray型態
                    if value is NSArray{
                        for p in value as! NSArray{
                            print("=>\(key): \(p)")
                        }
                    }
                    
                    // 有時候value是String型態
                    if value is String{
                        print("\(key): \(value!)")
                    }
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

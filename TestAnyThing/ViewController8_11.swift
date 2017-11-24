//
//  ViewController8_11.swift
//  TestAnyThing
//
//  Created by adamwang on 2017/6/15.
//  Copyright © 2017年 adamwang. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController8_11: UIViewController {
    
    
    @IBOutlet weak var myMap: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // ground 為自由女神像的座標
        var ground:CLLocationCoordinate2D = CLLocationCoordinate2DMake(40.689213, -74.044566)
        // eyeFrom 為攝影師的座標
        var eyeFrom:CLLocationCoordinate2D = CLLocationCoordinate2DMake(40.684, 74.042)
        // 設定攝影機位置與高度
        var camera:MKMapCamera = MKMapCamera(lookingAtCenter: ground, fromEyeCoordinate: eyeFrom, eyeAltitude: 50)
        
        // 允許可以從斜的方向觀看地圖，否則都是從正上方
        self.myMap.isPitchEnabled = true
        
        // 在地圖上加上攝影機
        self.myMap.camera = camera
        
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

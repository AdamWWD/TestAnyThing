//
//  ViewController_7_10.swift
//  TestAnyThing
//
//  Created by adamwang on 2017/7/25.
//  Copyright © 2017年 adamwang. All rights reserved.
//

import UIKit
import MapKit

class ViewController_7_10: UIViewController {
    
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // ground為巴黎鐵塔的座標
        let ground = CLLocationCoordinate2DMake(48.858356, 2.294481)
        
        // eyeFrom為攝影機的座標
        let eyeFrom = CLLocationCoordinate2DMake(48.847, 2.294481)
        
        // 設定攝影機位置與高度
        let camera = MKMapCamera(lookingAtCenter: ground, fromEyeCoordinate: eyeFrom, eyeAltitude: 50)
        
        // 設定以3D衛星圖方式呈現
        mapView.mapType = .satelliteFlyover
        
        // 允許可以從斜的方向觀看地圖，否則都是從正上方
        mapView.isPitchEnabled = true
        
        // 在地圖上加上攝影機
        mapView.camera = camera
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

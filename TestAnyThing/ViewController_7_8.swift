//
//  ViewController_7_8.swift
//  TestAnyThing
//
//  Created by adamwang on 2017/7/25.
//  Copyright © 2017年 adamwang. All rights reserved.
//

import UIKit
import MapKit

class ViewController_7_8: UIViewController {

    
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func btnStand(_ sender: Any) {
        // 標準
        mapView.mapType = .standard
    }
    
    
    @IBAction func btnSatellite(_ sender: Any) {
        // 衛星
        mapView.mapType = .satellite
    }
    
    @IBAction func Hybrid(_ sender: Any) {
        // 混合
        mapView.mapType = .hybrid
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

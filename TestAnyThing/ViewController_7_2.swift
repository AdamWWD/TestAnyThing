//
//  ViewController_7_2.swift
//  TestAnyThing
//
//  Created by adamwang on 2017/7/24.
//  Copyright © 2017年 adamwang. All rights reserved.
//

import UIKit
import MapKit

class ViewController_7_2: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let ann = MKPointAnnotation()
        ann.coordinate = CLLocationCoordinate2D(latitude: 24.137426, longitude: 121.275753)
        ann.title = "武嶺"
        ann.subtitle = "南投縣仁愛鄉"
        mapView.addAnnotation(ann)
        
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

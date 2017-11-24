//
//  ViewController_7_12.swift
//  TestAnyThing
//
//  Created by adamwang on 2017/7/25.
//  Copyright © 2017年 adamwang. All rights reserved.
//

import UIKit
import MapKit

class ViewController_7_12: UIViewController {
    
    
    
    
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onClick(_ sender: Any) {
        let request = MKLocalSearchRequest()
        // 可輸入地址或是關鍵字
        request.naturalLanguageQuery = "新創"
        // 這一行必須等地圖出現後才能得到正確的region資料
        request.region = mapView.region
        
        let search = MKLocalSearch(request: request)
        
        search.start{ (response, error) in
            guard error == nil else {
                return
            }
            
            guard response != nil else {
                return
            }
            
            for item in (response?.mapItems)! {
                self.mapView.addAnnotation(item.placemark)
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

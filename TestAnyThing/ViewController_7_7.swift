//
//  ViewController_7_7.swift
//  TestAnyThing
//
//  Created by adamwang on 2017/7/25.
//  Copyright © 2017年 adamwang. All rights reserved.
//

import UIKit
import MapKit

class ViewController_7_7: UIViewController, MKMapViewDelegate {
    
    
    @IBOutlet weak var mapView: MKMapView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        var points = [CLLocationCoordinate2D]()
        points.append(CLLocationCoordinate2D(latitude:24.2013, longitude:120.5810))
        points.append(CLLocationCoordinate2D(latitude:24.2044, longitude:120.6559))
        points.append(CLLocationCoordinate2D(latitude:24.1380, longitude:120.6401))
        points.append(CLLocationCoordinate2D(latitude:24.1424, longitude:120.5783))
        
        let polygon = MKPolygon(coordinates: &points, count: points.count)
        mapView.add(polygon)
    }
    
    func mapView(_ mapView:MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer
    {
        let render = MKPolygonRenderer(overlay: overlay)
        
        if overlay is MKPolygon {
            // 設定範圍內塗滿的顏色
            render.fillColor = UIColor.red.withAlphaComponent(0.2)
            
            // 設定畫筆顏色
            render.strokeColor = UIColor.red.withAlphaComponent(0.7)
            
            // 設定線條粗細
            render.lineWidth = 3
        }
        
        return render
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

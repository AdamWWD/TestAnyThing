//
//  ViewController_7_4.swift
//  TestAnyThing
//
//  Created by adamwang on 2017/7/24.
//  Copyright © 2017年 adamwang. All rights reserved.
//

import UIKit
import MapKit

class ViewController_7_4: UIViewController, MKMapViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let mapView = view.subviews.first as? MKMapView
        let ann = MKPointAnnotation()
        ann.coordinate = CLLocationCoordinate2D(latitude: 24.120305, longitude: 120.650916)
        mapView?.addAnnotation(ann)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation)->MKAnnotationView?
    {
        if annotation is MKUserLocation {
            return nil
        }
        
        var annView = mapView.dequeueReusableAnnotationView(withIdentifier: "Pin")
        
        if annView == nil{
            annView  = MKAnnotationView(annotation: annotation, reuseIdentifier: "Pin")
        }
        
        annView?.image = UIImage(named: "IronMan.jpeg")
        
        return annView
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

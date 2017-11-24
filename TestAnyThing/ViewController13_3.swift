//
//  ViewController13_3.swift
//  TestAnyThing
//
//  Created by adamwang on 2017/6/12.
//  Copyright © 2017年 adamwang. All rights reserved.
//

import UIKit

class ViewController13_3: UIViewController, XMLParserDelegate {

    var tagName = NSString()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let path = Bundle.main.path(forResource: "test", ofType: "xml")
        let xmlData = NSData(contentsOfFile: path!)
        let xml = XMLParser(data:xmlData! as Data)
        
        xml.delegate = self
        xml.parse()
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI namespaceURL: String?, qualifiedName qName: String?, attributes attributeDict: NSDictionary!)
    {
        if elementName == "student"
        {
            NSLog("入學年度:%@", attributeDict.object(forKey:"year") as! NSString)
        }
        
        if elementName == "id"
        {
            tagName = elementName as NSString
        }
        
        if elementName == "name"
        {
            tagName = elementName as NSString
        }
        
        if elementName == "tel"
        {
            tagName = elementName as NSString
        }
    }
    
    // 讀取標籤與標籤中間的內容，例如<name>John</name>
    func parser(_ parser:XMLParser, foundCharacters string:String)
    {
        if tagName == "id" {
            NSLog("學號:%@", string)
        }
        
        if  tagName == "name"
        {
            NSLog("姓名:%@", string)
        }
        
        if  tagName == "tel"
        {
            NSLog("電話:%@", string)
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName:String, namespaceURI: String?, qualifiedName qName: String?){
        tagName = ""
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

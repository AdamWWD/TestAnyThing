//
//  ViewController_Y_E_4_Move_Select_View.swift
//  TestAnyThing
//
//  Created by adamwang on 2017/8/29.
//  Copyright © 2017年 adamwang. All rights reserved.
//

import UIKit

class ViewController_Y_E_4_Move_Select_View: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var item1View: UIView!
    @IBOutlet var item2View: UIView!
    
    
    
    
    let list = ["Item1", "Item2"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        item1View.frame = view.frame
        view.addSubview(item1View)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = list[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var tmpView: UIView!
        let workingView = view.subviews.last
        
        if indexPath.row == 0 {
            tmpView = item1View
        }
        else if indexPath.row == 1{
            tmpView = item2View
        }
        
        if workingView != tmpView {
            tmpView.frame = (workingView?.frame)!
            workingView?.removeFromSuperview()
            view.addSubview(tmpView)
            
            tmpView.subviews.last?.menu()
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

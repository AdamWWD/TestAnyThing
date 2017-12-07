//
//  HotTextTableViewController.swift
//  TestAnyThing
//
//  Created by adamwang on 2017/11/29.
//  Copyright © 2017年 adamwang. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class HotTextTableViewController: UITableViewController {

    var hotTextArray:[Any]?
    
    @IBAction func refresh(_ sender:Any){
        loadData()
    }
    
    func loadData()
    {
        let urlString = "https://disp.cc/api/hot_text.json"
        Alamofire.request(urlString).responseJSON{ response in
            
            self.refreshControl?.endRefreshing()
            
            guard response.result.isSuccess else {
                let errorMessage = response.result.error?.localizedDescription
                print(errorMessage)
                return
            }
            
            guard let JSON = response.result.value as?[String: Any] else{
                print("JSON formate error")
                return
            }
            
            //print("JSON:\(JSON)")
            
            if let list = JSON["list"] as?[Any]{
                self.hotTextArray = list
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.refreshControl?.addTarget(self, action: #selector(refresh(_:)), for: UIControlEvents.valueChanged)
        
        loadData()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if let num = self.hotTextArray?.count{
            return num
        }else {
            return 0
        }
    }
    
    

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HotTextCell", for: indexPath) as! HotTextCell

        // 1.讀取第 indexPath.row的值
        guard let hotText = self.hotTextArray?[indexPath.row] as?[String: Any] else{
            print("Get now \(indexPath.row)error")
            return cell
        }
        
        // 2.填入label的值
        cell.titleLabel?.text = hotText["title"] as? String
        cell.descLabel?.text = hotText["desc"] as? String
        
        // 3.顯示縮圖
        let img_list = hotText["img_list"] as? [String]
        let placeholderImage = UIImage(named:"displogo120")
        if img_list?.count != 0{
            let url = URL(string:(img_list?[0])!)!
            cell.thumbImageView?.af_setImage(withURL: url, placeholderImage: placeholderImage)
        } else {
            cell.thumbImageView?.image = placeholderImage
        }
        
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "TextRead"{
            
            guard let textViewController = segue.destination as? TextViewController,
                let row = self.tableView.indexPathForSelectedRow?.row,
                let hotText = self.hotTextArray?[row] as? [String: Any]
                else{ return }
            
            textViewController.urlString = hotText["url"] as? String
        }
    }
}

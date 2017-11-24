//
//  ViewController.swift
//  TestAnyThing
//
//  Created by adamwang on 2017/5/25.
//  Copyright © 2017年 adamwang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var list:NSMutableArray!
    var another_list:NSMutableArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        list = NSMutableArray()
        list.add("看書")
        list.add("逛街")
        list.add("打球")
        
        another_list = NSMutableArray()
        another_list.add("義大利")
        another_list.add("荷蘭")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        // 將對應的陣列資料刪除
        list.remove(indexPath.row)
        // 實際刪除表格檢視中的一列，並選擇一個喜歡的刪除動畫
        tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.top)
        
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        var n:NSInteger!
        switch section {
        case 0:
            n = list.count
            break;
        case 1:
            n = another_list.count
            break;
        default:
            break
        }
        
        return n
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section:Int)-> String?
    {
        var header:String!
        
        switch section {
        case 0:
            header = "我最喜歡的休閒活動"
            break
        case 1:
            header = "我去過的國家"
            break
        default:
            break
        }
        
        return header
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        var cell:UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "Cell") as? UITableViewCell
        
        if (cell == nil)
        {
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        }
        
        // 區分顯示區段 開始
        switch indexPath.section {
        case 0:
            cell!.textLabel!.text = list.object(at: indexPath.row) as? String
            break
        case 1:
            cell!.textLabel!.text = another_list.object(at: indexPath.row) as? String
            break
            
        default:
            break;
        }
        
        
//        cell!.textLabel!.text = list.object(at: indexPath.row) as? String
        
        // 設定儲存格指示器開始
//        switch (indexPath.row) {
//        case 0: // 確認指示器
//            cell?.accessoryType = UITableViewCellAccessoryType.checkmark
//            break
//        case 1: // 細節指示器
//            cell?.accessoryType = UITableViewCellAccessoryType.detailButton
//            break
//        case 2: // 細節揭露指示器
//            cell?.accessoryType = UITableViewCellAccessoryType.detailDisclosureButton
//            break
//        case 3: // 揭露指示器
//            cell?.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
//            break
//        default:
//            return cell!
//        }
        
        return cell!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


//
//  ViewController_Y_E_8_Table.swift
//  TestAnyThing
//
//  Created by adamwang on 2017/9/1.
//  Copyright © 2017年 adamwang. All rights reserved.
//

import UIKit

class ViewController_Y_E_8_Table: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var list = [String]()
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        list.append("台北")
        list.append("台中")
        list.append("高雄")
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        tableView.isEditing = true
//    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let tmp = list[sourceIndexPath.row]
        list.remove(at: sourceIndexPath.row)
        list.insert(tmp, at: destinationIndexPath.row)
    }
    
//    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
//        return .none
//    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = list[indexPath.row]
        cell.imageView?.image = UIImage(named: list[indexPath.row])
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath = tableView.indexPathForSelectedRow
        let str = list[indexPath!.row]
        let vc = segue.destination as? ViewController_Y_E_8_SecondVC
        vc?.str = str
        
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let editAction = UITableViewRowAction(style: .normal, title: "編輯") {
            (rowAction, indexPath) in
            
            let alert = UIAlertController(title:nil, message:"修改資料", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "確定", style: .default, handler:{
                (action) in
                
                let textFild = alert.textFields?.first
                self.list[indexPath.row] = textFild?.text ?? ""
                tableView.reloadData()
            })
            
            let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
            
            alert.addTextField{ (textFiled) in
                textFiled.text = self.list[indexPath.row]
            }
            
            alert.addAction(okAction)
            alert.addAction(cancelAction)
            
            self.present(alert, animated: true, completion: nil)
        }
        
        let deleteAction = UITableViewRowAction(style: .destructive, title: "刪除") {
            (rowAction, indexPath) in
            
            self.list.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .none
        
        return [deleteAction, editAction]
    }
    
    func tableView(_ tableView: UITableView, didEndEditingRowAt indexPath: IndexPath?) {
        if let indexPath = indexPath{
            let cell = tableView.cellForRow(at: indexPath)
            cell?.accessoryType = .disclosureIndicator
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

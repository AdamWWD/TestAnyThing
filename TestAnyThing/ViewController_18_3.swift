//
//  ViewController_18_3.swift
//  TestAnyThing
//
//  Created by adamwang on 2017/8/9.
//  Copyright © 2017年 adamwang. All rights reserved.
//

import UIKit

class ViewController_18_3: UIViewController {
    
    let delegate = UIApplication.shared.delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        query()
        insert()
    }
    
    func insert()
    {
        if delegate.db != nil {
            let iid = "a02".cString(using: .utf8)
            let cname = "李大媽".cString(using: .utf8)
            let sql = "INSERT INTO UserData VALUES (?, ?, NULL)"
            
//            let sql = "INSERT INTO UserData(iid, cname, image) VALUES (?, ?, NULL)"
            
            // 用來儲存查詢後的結果
            var statement: OpaquePointer? = nil
            
            if sqlite3_prepare(delegate.db, sql, -1, &statement, nil) != SQLITE_OK {
                let errmsg = String(cString: sqlite3_errmsg(delegate.db))
                print("prepare error: \(errmsg)")
            }
            
            // bind指令要在prepare之後
            // 第二個參數1代表SQL Command中的第1個問號
            if sqlite3_bind_text(statement, 1, iid, -1, nil) != SQLITE_OK {
                let errmsg = String(cString: sqlite3_errmsg(delegate.db))
                print("bind error: \(errmsg)")
            }
            
            // 第二個參數2代表SQL Command中的第2個問號
            if sqlite3_bind_text(statement, 2, cname, -1, nil) != SQLITE_OK{
                let errmsg = String(cString: sqlite3_errmsg(delegate.db))
                print("bind error: \(errmsg)")
            }
            
            if sqlite3_step(statement) == SQLITE_DONE {
                print("插入新資料成功")
            } else {
                let errmsg = String(cString: sqlite3_errmsg(delegate.db))
                print("bind error: \(errmsg)")
            }
            
            sqlite3_finalize(statement)
        }
    }
    
    func query()
    {
        print("query()")
        
        if delegate.db != nil {
            let tmp = "李大媽".cString(using: .utf8)
            let sql = "SELECT * FROM UserData WHERE cname = ?"
//            let sql = "SELECT * FROM UserData WHERE cname = 李大媽"
            
            // 用來儲存查詢後的結果
            var statement: OpaquePointer? = nil
            if sqlite3_prepare(delegate.db, sql, -1, &statement, nil) != SQLITE_OK {
                let errmsg = String(cString: sqlite3_errmsg(delegate.db))
                print("prepare error: \(errmsg)")
            }
            
            // bind指令要在prepare之後
            // 第二個參數1代表SQL Command中的第1個問號
            if sqlite3_bind_text(statement, 1, tmp, -1, nil) != SQLITE_OK {
                let errmsg = String(cString: sqlite3_errmsg(delegate.db))
                print("bind error: \(errmsg)")
            }
            
            // 例用迴圈取出查詢結果
            while sqlite3_step(statement) == SQLITE_ROW {
                let iid = sqlite3_column_text(statement, 0)
                let cname = sqlite3_column_text(statement, 1)
                
                if iid != nil {
                    let iidS = String(cString: iid!)
                    print("帳號: \(iidS)")
                }
                
                if cname != nil {
                    let cnameS = String(cString: cname!)
                    print("姓名: \(cnameS)")
                }
            }
            
//            print(statement)
            sqlite3_finalize(statement)
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

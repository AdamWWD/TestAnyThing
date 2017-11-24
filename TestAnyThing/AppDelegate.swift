//
//  AppDelegate.swift
//  TestAnyThing
//
//  Created by adamwang on 2017/5/25.
//  Copyright © 2017年 adamwang. All rights reserved.
//

import UIKit


extension UIView{

    func menu()
    {
        var frame = self.superview?.frame
        
        if frame?.origin.x == 0 {
            frame?.origin.x = 200
        }
        else
        {
            frame?.origin.x = 0
        }
        
        UIView.animate(withDuration: 0.5)
        {
            self.superview?.frame = frame!
        }
    }
    
    
    func slideByFinger(location: CGPoint, state: UIGestureRecognizerState){
        
        struct FirstTouch{
            static var location: CGPoint? = nil
        }
    
        var frame = (self .superview?.frame)!
        switch state{
        case .began:
            FirstTouch.location = location
        case .changed:
            frame.origin.x = location.x - FirstTouch.location!.x
            if frame.origin.x < 0 {
                frame.origin.x = 0
            }
            self.superview?.frame = frame
            
        default:
            if frame.origin.x > 100
            {
                frame.origin.x = 200
            }
            else
            {
                frame.origin.x = 0
            }
            
            UIView.animate(withDuration: 0.5, animations: {
                self.superview?.frame = frame
            })
        }
    
    }

}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var db:OpaquePointer? = nil
    
//    let lm = CLLocationManager()
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
//        copyPropertyList_18_1()
//        connectDB()
        
        return true
    }
    
    func connectDB()
    {
        let fm = FileManager.default
        let src = Bundle.main.path(forResource: "mydb", ofType: "sqlite")
        let dst = NSHomeDirectory() + "/Documents/mydb.sqlite"
        
        print("dst"+dst)
        
        if !fm.fileExists(atPath: dst)
        {
            try! fm.copyItem(atPath: src!, toPath: dst)
        }
        
        if sqlite3_open(src!, &db) == SQLITE_OK
        {
            print("資料庫開啟成功")
        }
        else
        {
            print("開啟資料庫失敗")
        }
    
    }
    
    func closeDB()
    {
        guard db != nil else {
            return
        }
        
        sqlite3_close(db!)
    }
    
    func copyPropertyList_18_1()
    {
        let fm = FileManager.default
        
        // 取得 Property List.plist 在專案中的路徑
        let src = Bundle.main.path(forResource:"Property List_18_1", ofType: "plist")
        print("src:"+src!)
        
        // 取得要複製到的目的路徑
        let dst = NSHomeDirectory() + "/Documents/Property List_18_1.plist"
        print("dst:"+dst)
        // 檢查目的路徑的 Property List.plist檔案是否已經存在，如果不存在則複製檔案
        if !fm.fileExists(atPath: dst)
        {
            try! fm.copyItem(atPath: src!, toPath: dst)
        }
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.

        closeDB()
    }
    
    func add(x:NSInteger, value y:NSInteger)->NSInteger{
        return x + y
    }


}


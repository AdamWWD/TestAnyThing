//
//  ViewController6_5.swift
//  TestAnyThing
//
//  Created by adamwang on 2017/6/2.
//  Copyright © 2017年 adamwang. All rights reserved.
//

import UIKit
import AssetsLibrary

class ViewController6_5: UIViewController {
    
    var library:ALAssetsLibrary = ALAssetsLibrary();
    // 使用參數ALAssetsLibrarySaveedPhoto取出所有存檔照片
    var imageArray:NSMutableArray = NSMutableArray();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.library.enumerateGroupsWithTypes(ALAssetsGroupSavedPhotos,
                                              
                                              usingBlock: {(group:ALAssetsGroup!, stop:UnsafeMutablePointer<ObjCBool>)->Void in
                                                
                                                let tempArray = NSMutableArray()
                                                if (group != nil)
                                                {
                                                    group.enumerateAssets(
                                                        {(result:ALAsset!, index:Int, stop:UnsafeMutablePointer<ObjCBool>)-> Void in
                                                            
                                                            if (result != nil)
                                                            {
                                                                tempArray.add(result);
                                                            }
                                                        } as! ALAssetsGroupEnumerationResultsBlock);
                                                    self.imageArray = NSMutableArray(array: tempArray)
                                                    NSLog("取出照片共%d張", (self.imageArray.count))
                                                }
                                                } as! ALAssetsLibraryGroupsEnumerationResultsBlock, failureBlock: { (error:NSError!) -> Void in
                                                        // 讀取照片失敗
                                                        NSLog("讀取照片失敗");
                                                    } as! ALAssetsLibraryAccessFailureBlock);
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

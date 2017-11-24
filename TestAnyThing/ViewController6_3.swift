//
//  ViewController6_3.swift
//  TestAnyThing
//
//  Created by adamwang on 2017/6/2.
//  Copyright © 2017年 adamwang. All rights reserved.
//

import UIKit

class ViewController6_3: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func TakePhoto(_ sender: Any) {
        // 先檢查裝置是否配備相機
        if (UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera))
        {
            let imagePicker = UIImagePickerController();
            
            // 設定相片來源為裝置上的相機
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera;
            
            // 設定 imagePicker的delegate為ViewController
            imagePicker.delegate = self;
            
            // 開啟相機拍照頁面
            self.present(imagePicker, animated: true, completion: nil);
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        // 取得使用者拍攝的照片
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage;
        
        // 存檔
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
        
        // 關閉照片程式
        self.dismiss(animated: true, completion: nil);
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // 當使用者按下取消按鈕後關閉拍照程式
        self.dismiss(animated: true, completion: nil);
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

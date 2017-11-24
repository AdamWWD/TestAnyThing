//
//  ViewController_Y_E_2.swift
//  TestAnyThing
//
//  Created by adamwang on 2017/8/24.
//  Copyright © 2017年 adamwang. All rights reserved.
//

import UIKit

class ViewController_Y_E_2: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    
    @IBOutlet var myView: UIView!
    
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBOutlet weak var button: UIButton!
    
    let list = ["台北", "台中", "高雄"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("viewDidLoad YE2")

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        view.addSubview(myView)
        myView.translatesAutoresizingMaskIntoConstraints = false
        
        myView.heightAnchor.constraint(equalToConstant: 128).isActive = true
        myView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        myView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        let c = myView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 128)
        c.identifier = "bottom"
        c.isActive = true
        
        myView.layer.cornerRadius = 10
        
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return list.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return list[row]
    }
    
    
    @IBAction func doneClick(_ sender: Any) {
        
        let title = list[pickerView.selectedRow(inComponent: 0)]
        button.setTitle(title, for: .normal)
        
        
        displayPickerView(false)
    }

    @IBAction func selectClick(_ sender: Any) {
        displayPickerView(true)
    }
    
    
    func displayPickerView(_ show: Bool){
        for c in view.constraints{
            if c.identifier == "bottom"{
                c.constant = (show) ? -10 :128
                break
            }
        }
        
        UIView.animate(withDuration: 0.5){
            self.view.layoutIfNeeded()
        }
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

//
//  SampleClass14_7.swift
//  TestAnyThing
//
//  Created by adamwang on 2017/6/9.
//  Copyright © 2017年 adamwang. All rights reserved.
//

import Foundation
protocol SampleDelegate {
    func finish(sampleClass:SampleClass14_7)
}

class SampleClass14_7
{
    var delegate:SampleDelegate?
    
    init(){
        // 一定要加
    }
    
    func doSomething(){
        self.delegate?.finish(sampleClass: self)
    }

}

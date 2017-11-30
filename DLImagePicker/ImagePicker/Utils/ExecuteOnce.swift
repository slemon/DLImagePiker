//
//  ExecuteOnce.swift
//  DLImagePicker
//
//  Created by Dalong on 2017/11/30.
//  Copyright © 2017年 Dalong. All rights reserved.
//

import Foundation

class ExecuteOnce {
    
    var already : Bool = false
    func run(_ block:() -> Void) {
        guard !already else { return }
        block()
        already = true
    }
    
}

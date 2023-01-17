//
//  Toast.swift
//  ApiCalling
//
//  Created by Ahmad Fouad on 20/01/16.
//  Copyright © 2016 Openxcell. All rights reserved.
//

import UIKit
import Toaster


let TimeIntervalss : Double = 3.0

class ShowToast {
    
    class func ShowToast(_ withText : String) {
        //_ = Toast.init(text: withText, delay: Delay.short, duration: TimeInterval)
        ToastCenter.default.currentToast?.cancel()
        _ = Toast(text: withText, delay: 0, duration: TimeIntervalss).show()
    }
    
}

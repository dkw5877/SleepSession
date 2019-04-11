//
//  NightSleep.swift
//  SleepQuality
//
//  Created by user on 4/5/19.
//  Copyright © 2019 user. All rights reserved.
//

import Foundation

struct NightSleep {
    
    let startTime:Date = Date()
    let endTime:Date = Date()
    let quality:Float = 0.78
    
    var length:String {
        return "23:30 - 07:34"
    }
    
    var timeInBed:String {
        return "8h 4m in bed"
    }
    
    var percent:String {
        return "78%"
    }
    
    var measure:String {
        return "Sleep Quality"
    }
    
}

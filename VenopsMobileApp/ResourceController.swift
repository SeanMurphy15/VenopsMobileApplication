//
//  ResourceController.swift
//  VenopsMobileApp
//
//  Created by Sean Murphy on 2/17/16.
//  Copyright © 2016 Jay Maloney. All rights reserved.
//

import Foundation


class ResourceController {


    static func currentDeviceType() -> String? {


        if let device = UIDevice.currentDevice().model as? String{

            let operatingSystem = UIDevice.currentDevice().systemName

            let deviceType = device.stringByAppendingString(" \(operatingSystem)")

            return deviceType

        }


    }

    static func currentDate() -> String? {

        let formatter = NSDateFormatter()
        formatter.dateStyle = NSDateFormatterStyle.LongStyle
        formatter.timeStyle = .MediumStyle

        let date = formatter.stringFromDate(NSDate())
        
        return date
    }
    
}

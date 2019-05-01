//
//  Utils.swift
//  UNAM360
//
//  Created by Alejandro Mendoza on 4/30/19.
//  Copyright © 2019 IOSDevLab. All rights reserved.
//

import Foundation


func accelerationIntoDegrees(_ axis1Acceleration: Double, _ axis2Acceleration: Double) -> Double{
    let angle = atan2(axis1Acceleration, axis2Acceleration)
    return (angle * 180/Double.pi)
}

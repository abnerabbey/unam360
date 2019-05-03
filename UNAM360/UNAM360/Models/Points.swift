//
//  Points.swift
//  UNAM360
//
//  Created by 2019 on 5/2/19.
//  Copyright © 2019 IOSDevLab. All rights reserved.
//

import Foundation
import CoreLocation

public struct Points: Codable {
    var name: String
    var location: Location
    var image: String
    var placeType: String
    var pumabus: String
}

struct Location: Codable {
    var latitude: Double
    var longitude: Double
}

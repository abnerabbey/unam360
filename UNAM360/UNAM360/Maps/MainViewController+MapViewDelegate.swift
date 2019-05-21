//
//  MainViewController+MapViewDelegate.swift
//  UNAM360
//
//  Created by Carlos Daniel Hernandez Chauteco on 5/13/19.
//  Copyright © 2019 IOSDevLab. All rights reserved.
//
import MapKit

fileprivate let points: [Points] = {
    let data = loadDataFromFile(named: "pointsData", inFormat: "json")!
    let points = try! JSONDecoder().decode([Points].self, from: data)
    return points
}()

extension ViewController: MKMapViewDelegate{
    
}

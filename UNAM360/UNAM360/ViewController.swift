//
//  ViewController.swift
//  UNAM360
//
//  Created by Carlos Daniel Hernandez Chauteco on 4/25/19.
//  Copyright © 2019 IOSDevLab. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mapView: UIView!
    
    let map = MKMapView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        map.frame = mapView.bounds
        mapView.addSubview(map)
        
    }


}


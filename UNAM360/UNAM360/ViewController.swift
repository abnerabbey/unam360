//
//  ViewController.swift
//  UNAM360
//
//  Created by Carlos Daniel Hernandez Chauteco on 4/25/19.
//  Copyright © 2019 IOSDevLab. All rights reserved.
//

import UIKit
import MapKit
import ARKit
import SceneKit

class ViewController: UIViewController {
    
    let mapView = MKMapView()
    let arScene = ARSCNView()

    let accelerometerHandler = AccelerometerHandler()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        accelerometerHandler.delegate = self
        //adjust maps
        mapView.frame = self.view.bounds
        mapView.delegate = self
        self.view.addSubview(mapView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupARConfiguration()
        
        arScene.frame = self.view.bounds
        self.view.addSubview(arScene)
    }
    
    func setupARConfiguration(){
        let configuration = ARWorldTrackingConfiguration()
        arScene.session.run(configuration)
    }

}


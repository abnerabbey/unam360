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
    
    @IBOutlet weak var mapView: UIView!
    @IBOutlet weak var arView: UIView!
    
    let map = MKMapView()
    let arScene = ARSCNView()

    let accelerometerHandler = AccelerometerHandler()
    
    let points: [Points] = {
        let data = loadDataFromFile(named: "pointsData", inFormat: "json")!
        let points = try! JSONDecoder().decode([Points].self, from: data)
        return points
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        accelerometerHandler.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        map.frame = mapView.bounds
        mapView.addSubview(map)
        
        setupARConfiguration()
        
        arScene.frame = arView.bounds
        arView.addSubview(arScene)
    }
    
    func setupARConfiguration(){
        let configuration = ARWorldTrackingConfiguration()
        arScene.session.run(configuration)
    }

}


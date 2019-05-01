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
import CoreMotion

class ViewController: UIViewController {
    
    @IBOutlet weak var mapView: UIView!
    @IBOutlet weak var arView: UIView!
    
    let map = MKMapView()
    let arScene = ARSCNView()
    
    let motionManager = CMMotionManager()
    
    var devicePosition: DevicePosition = .horizontal {
        willSet {
            deviceWillChangeOrientationTo(newValue)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startGatheringAccelerometerData()
        // Do any additional setup after loading the view.
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
    
    func startGatheringAccelerometerData(){
        motionManager.accelerometerUpdateInterval = 0.05
        
        motionManager.startAccelerometerUpdates(to: OperationQueue.current!) {
            [unowned self]
            (data, error) in
            if let accelerometerData = data {
                let angle = abs(accelerationIntoDegrees(accelerometerData.acceleration.y, accelerometerData.acceleration.z))
                
                if angle < 150 {
                    self.devicePosition = .vertical
                }
                else {
                    self.devicePosition = .horizontal
                }
            }
        }
    }
    
    func deviceWillChangeOrientationTo(_ orientation: DevicePosition) {
        if orientation == .vertical {
            self.arScene.isHidden = false
            setupARConfiguration()
        }
        else{
            self.arScene.isHidden = true
            self.view.sendSubviewToBack(arScene)
        }
        
    }

}


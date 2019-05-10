//
// Created by Alejandro Mendoza on 2019-05-09.
// Copyright (c) 2019 IOSDevLab. All rights reserved.
//
import Foundation
import CoreMotion

class AccelerometerHandler {

    fileprivate let motionManager = CMMotionManager()

    fileprivate let updateInterval: TimeInterval = 0.05

    var delegate: AccelerometerProtocol?

    var devicePosition: DevicePosition = .horizontal {
        willSet {
            self.delegate?.deviceWillChangeOrientationTo(newValue)
        }
    }


    init(){
        startGatheringAccelerometerData()
    }

    func startGatheringAccelerometerData(){
        motionManager.accelerometerUpdateInterval = updateInterval

        motionManager.startAccelerometerUpdates(to: OperationQueue.current!) { data, error in

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

}

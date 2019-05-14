//
// Created by Alejandro Mendoza on 2019-05-09.
// Copyright (c) 2019 IOSDevLab. All rights reserved.
//

import Foundation

extension ViewController: AccelerometerProtocol {

    func deviceWillChangeOrientationTo(_ orientation: DevicePosition) {
        if orientation == .vertical {
            self.arScene.isHidden = false
            setupARConfiguration()
        }
        else{
            self.arScene.isHidden = true
        }
    }

}

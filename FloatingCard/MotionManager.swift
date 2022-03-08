//
//  MotionManager.swift
//  FloatingCard
//
//  Created by Rahul Narayanan on 3/6/22.
//

import CoreMotion

class MotionManager: ObservableObject {
    private var motionManager = CMMotionManager()
    @Published var pitch = 0.0
    @Published var roll = 0.0
    @Published var yaw = 0.0
    
    init() {
        motionManager.startDeviceMotionUpdates(to: OperationQueue()) { [weak self] motion, error in
            guard let self = self, let motion = motion else { return }
            
            DispatchQueue.main.async {
                self.pitch = motion.attitude.pitch
                self.roll = motion.attitude.roll
                self.yaw = motion.attitude.yaw
            }
            
        }
    }
    
    deinit {
        motionManager.stopDeviceMotionUpdates()
    }
}

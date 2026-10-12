//
//  Gyro.swift
//  Chats
//
//  Created by Flaky le Flaker (Mineturtlee) on 11/10/26.
//

import SwiftUI
import SwiftData
import CoreMotion
internal import Combine
import UIKit

class MotionDataProv: ObservableObject {
    static let shared = MotionDataProv()
    
    private let motionProvider = CMMotionManager()
    private var refreshRate: TimeInterval {
        didSet {
            motionProvider.deviceMotionUpdateInterval = refreshRate
        }
    }
    
    @Published var x = 0.0
    @Published var y = 0.0
    
    init() {
        let scene = UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .first
        
        refreshRate = 1/Double((scene?.screen.maximumFramesPerSecond ?? 60) + 60)
    }
    
    func start() {
        motionProvider.startDeviceMotionUpdates(to: .main) { [weak self] data, error in
            guard let motion = data?.attitude else { return }
            self?.x = motion.roll
            self?.y = motion.pitch
        }
    }
    
    func stop() {
        motionProvider.stopDeviceMotionUpdates()
    }
    
    func setRefreshRate(_ frames: Double) {
        self.refreshRate = 1/frames
    }
}

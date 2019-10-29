//
//  AccelerometerViewController.swift
//  mobile_development
//
//  Created by Владимир Нереуца on 14.11.2018.
//  Copyright © 2018 Владимир Нереуца. All rights reserved.
//
//  https://developer.apple.com/documentation/coremotion/getting_raw_accelerometer_events

import UIKit
import CoreMotion

final class AccelerometerViewController: UIViewController {
  
  // MARK: IBOutlets
  @IBOutlet private var xAxisLabel: UILabel!
  @IBOutlet private var yAxisLabel: UILabel!
  @IBOutlet private var zAxisLabel: UILabel!
  
  @IBOutlet private var xAxisValueLabel: UILabel!
  @IBOutlet private var yAxisValueLabel: UILabel!
  @IBOutlet private var zAxisValueLabel: UILabel!
  @IBOutlet private var accelerometerTitleLabel: UILabel!
  
  // MARK: Timer
  private lazy var motion = CMMotionManager()
  private var timer = Timer()
  private let timeInterval: TimeInterval = 1 / 60
  
  // MARK: Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    startAccelerometers()
    configureUI()
  }
  
  // MARK: Methods
  private func configureUI() {
    xAxisLabel.text = translateFor(key: .AccelerometerXAxis)
    yAxisLabel.text = translateFor(key: .AccelerometerYAxis)
    zAxisLabel.text = translateFor(key: .AccelerometerZAxis)
    accelerometerTitleLabel.text = translateFor(key: .AccelerometerTitleLabel)
  }
  
  private func startAccelerometers() {
    // Make sure the accelerometer hardware is available.
    if self.motion.isAccelerometerAvailable {
      self.motion.accelerometerUpdateInterval = timeInterval  // 60 Hz
      self.motion.startAccelerometerUpdates()
      
      // Configure a timer to fetch the data.
      self.timer = Timer(fire: Date(), interval: timeInterval, repeats: true, block: { timer in
        // Get the accelerometer data.
        if let data = self.motion.accelerometerData {
          let x = data.acceleration.x
          let y = data.acceleration.y
          let z = data.acceleration.z
          
          self.xAxisValueLabel.text = String(x)
          self.yAxisValueLabel.text = String(y)
          self.zAxisValueLabel.text = String(z)
        }
      })
      
      // Add the timer to the current run loop.
      RunLoop.current.add(self.timer, forMode: RunLoop.Mode.default)
    }
  }
  
}

// MARK: - StoryboardInstantiatable
extension AccelerometerViewController: StoryboardInstantiatable {
  
  static var storyboardName: String {
    return StoryboardNamed.main.description
  }
  
}

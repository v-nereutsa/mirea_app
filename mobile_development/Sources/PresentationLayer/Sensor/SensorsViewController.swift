//
//  SensorsViewController.swift
//  mobile_development
//
//  Created by Владимир Нереуца on 23.11.2018.
//  Copyright © 2018 Владимир Нереуца. All rights reserved.
//

import UIKit

final class SensorsViewController: UIViewController {
  
  @IBOutlet private var accelerometerView: UIView!
  @IBOutlet private var cameraView: UIView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let accelerometerController = AccelerometerViewController.instantiateFromStoryboard()
    addChild(accelerometerController)
    guard let resultAccelerometerView = accelerometerController.view else { return }
    resultAccelerometerView.frame = accelerometerView.frame
    accelerometerView.addSubview(resultAccelerometerView)
    
    let cameraController =  CameraViewController.instantiateFromStoryboard()
    addChild(cameraController)
    guard let resultCameraView = cameraController.view else { return }
    resultCameraView.frame.origin = .zero
    resultCameraView.frame.size = cameraView.bounds.size
    cameraView.addSubview(resultCameraView)
    
    title = translateFor(key: .SensorsTitle)
  }
  
}

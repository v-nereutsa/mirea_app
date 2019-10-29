//
//  CustomButton.swift
//  Calculator
//
//  Created by Владимир Нереуца on 03.04.2018.
//  Copyright © 2018 Владимир Нереуца. All rights reserved.
//

import UIKit

final class CustomButton: UIButton {

  override func draw(_ rect: CGRect) {
    let maskPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: 32)
    
    let maskLayer   = CAShapeLayer()
    maskLayer.frame = self.bounds
    maskLayer.path  = maskPath.cgPath
    self.layer.mask = maskLayer
  }
  
}

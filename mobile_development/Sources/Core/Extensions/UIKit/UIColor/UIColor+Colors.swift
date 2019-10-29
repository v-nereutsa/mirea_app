//
//  UIColor+Colors.swift
//  mobile_development
//
//  Created by Владимир Нереуца on 06.12.2018.
//  Copyright © 2018 Владимир Нереуца. All rights reserved.
//

import UIKit.UIColor

extension UIColor {
  enum ColorType {
    case gray
    case darkGray
    case strongGray
    case textGray
    case tableViewTextGray
    case lightGrayBg
    case lightRed
    case superLightRed
    case red
    case white
    case snowWhite
    case black
    case middleBlack
    case lightGray
    case pink
    case veryLightBlue
    case brightBlue
    case lightBlue
    case green
  }
  
  convenience init(_ colorType: ColorType, alpha: CGFloat = 1.0) {
    switch colorType {
    case .gray:
      self.init(hexString: "8C8C8C")
    case .green:
      self.init(hexString: "3AD29F")
    case .strongGray:
      self.init(hexString: "555555")
    case .textGray:
      self.init(hexString: "aaabaa")
    case .tableViewTextGray:
      self.init(hexString: "8f8e94")
    case .lightGrayBg:
      self.init(hexString: "e7e7e7")
    case .darkGray:
      self.init(hexString: "BCBBC1", alpha: alpha)
    case .lightRed:
      self.init(hexString: "FF3B30", alpha: alpha)
    case .red:
      self.init(hexString: "DB1D5F")
    case .superLightRed:
      self.init(hexString: "FFEBEA")
    case .white:
      self.init(hexString: "FDFEFE")
    case .snowWhite:
      self.init(hexString: "FFFFFF", alpha: alpha)
    case .black:
      self.init(hexString: "000000", alpha: alpha)
    case .middleBlack:
      self.init(hexString: "464646")
    case .lightGray:
      self.init(hexString: "E3E5E5")
    case .pink:
      self.init(hexString: "C550DC")
    case .veryLightBlue:
      self.init(hexString: "F7FAFF")
    case .brightBlue:
      self.init(hexString: "007AFF")
    case .lightBlue:
      self.init(hexString: "E7F2FF")
    }
  }
  
}

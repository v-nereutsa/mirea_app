//
//  String+Range.swift
//  mobile_development
//
//  Created by Владимир Нереуца on 06.12.2018.
//  Copyright © 2018 Владимир Нереуца. All rights reserved.
//

import Foundation

extension String {
  func substring(from index: Int) -> String {
    let index = self.index(startIndex, offsetBy: index)
    return String(self[index...])
  }
  
  func substring(with range: Range<Int>) -> String {
    let startIndex = self.index(self.startIndex, offsetBy: range.lowerBound)
    let endIndex = self.index(self.startIndex, offsetBy: range.upperBound)
    return String(self[startIndex ..< endIndex])
  }
  
}

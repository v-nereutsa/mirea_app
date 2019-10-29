//
//  List+RemoveDuplicates.swift
//  mobile_development
//
//  Created by Владимир Нереуца on 29.11.2018.
//  Copyright © 2018 Владимир Нереуца. All rights reserved.
//

import Foundation
import RealmSwift

extension List {
  func removeDublicates<T: Hashable>(rule: ((_ element: Element) -> T)) {
    var identifiers = Set<T>()
    var dublicatesIndexes = [Int]()
    
    for (index, value) in self.enumerated() {
      let identifier = rule(value)
      
      if identifiers.contains(identifier) {
        dublicatesIndexes.append(index)
      } else {
        identifiers.insert(identifier)
      }
    }
    
    while dublicatesIndexes.count > 0 {
      let last = dublicatesIndexes.removeLast()
      remove(at: last)
    }
  }
}

//
//  Object+Singletone.swift
//  mobile_development
//
//  Created by Владимир Нереуца on 29.11.2018.
//  Copyright © 2018 Владимир Нереуца. All rights reserved.
//

import RealmSwift
import Foundation

protocol ObjectSingletone: class {
  //    init()
}

extension ObjectSingletone where Self: Object {
  static var value: Self {
    let object = mainRealm.objects(Self.self).first
    if let value = object {
      return value
    } else {
      let value = Self()
      
      mainRealm.realmWrite {
        mainRealm.add(value)
      }
      
      return value
    }
  }
}

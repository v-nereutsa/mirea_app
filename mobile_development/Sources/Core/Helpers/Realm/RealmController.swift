//
//  RealmController.swift
//  mobile_development
//
//  Created by Владимир Нереуца on 29.11.2018.
//  Copyright © 2018 Владимир Нереуца. All rights reserved.
//

import RealmSwift
import Foundation

var mainRealm: Realm!

class RealmController {
  
  static var shared = RealmController()
  
  private init() { }
  
  func setup() {
    Realm.Configuration.defaultConfiguration = Realm.Configuration(schemaVersion: 0, migrationBlock: nil)
    
    do {
      mainRealm = try Realm()
    } catch let error as NSError {
      NotificationCenter.default.post(name: .RealmLoadingErrorNotifications, object: nil)
      assertionFailure("Realm loading error: \(error)")
    }
  }
  
  
}

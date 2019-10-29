//
//  WriteFunctions.swift
//  mobile_development
//
//  Created by Владимир Нереуца on 29.11.2018.
//  Copyright © 2018 Владимир Нереуца. All rights reserved.
//

import Foundation
import RealmSwift

extension Realm {
  public func realmWrite(_ block: (() -> Void)) {
    if isInWriteTransaction {
      block()
    } else {
      do {
        try write(block)
      } catch {
        NotificationCenter.default.post(name: .RealmWritingErrorNotifications, object: nil)
        assertionFailure("Realm write error: \(error)")
      }
    }
  }
}

func realmWrite(realm: Realm = mainRealm, _ block: (() -> Void)) {
  realm.realmWrite(block)
}

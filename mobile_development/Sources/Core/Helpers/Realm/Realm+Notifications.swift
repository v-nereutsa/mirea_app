//
//  Realm+Notifications.swift
//  mobile_development
//
//  Created by Владимир Нереуца on 29.11.2018.
//  Copyright © 2018 Владимир Нереуца. All rights reserved.
//

import Foundation

extension Notification.Name {
  static let RealmLoadingErrorNotifications: Notification.Name =
    Notification.Name(rawValue: "RealmLoadingErrorNotifications")
  static let RealmWritingErrorNotifications: Notification.Name =
    Notification.Name(rawValue: "RealmWritingErrorNotifications")
}

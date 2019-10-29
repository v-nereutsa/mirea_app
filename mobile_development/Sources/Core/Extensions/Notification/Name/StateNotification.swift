//
//  StateNotification.swift
//  mobile_development
//
//  Created by Владимир Нереуца on 05.12.2018.
//  Copyright © 2018 Владимир Нереуца. All rights reserved.
//

import Foundation

extension Notification.Name {
  
  static let StateUserLogInNotification: Notification.Name = Notification.Name("StateUserLogInNotifications")
  static let StateUserLogOutNotification: Notification.Name = Notification.Name("StateUserLogOutNotifications")
  static let StateUserErrorNotification: Notification.Name = Notification.Name("StateUserErrorNotification")
  
}

//
//  State.swift
//  mobile_development
//
//  Created by Владимир Нереуца on 05.12.2018.
//  Copyright © 2018 Владимир Нереуца. All rights reserved.
//

import Foundation

enum State: String {
  
  case loggedIn
  case loggedOut
  case error
  
  var value: String {
    
    set {
      switch newValue {
      case State.loggedIn.rawValue:  self = .loggedIn
      case State.loggedOut.rawValue: self = .loggedOut
      default: self = .error
      }
    }
    
    get {
      switch self {
      case .loggedIn:  return State.loggedIn.rawValue
      case .loggedOut: return State.loggedOut.rawValue
      case .error:     return State.error.rawValue
      }
    }
    
  }
  
}

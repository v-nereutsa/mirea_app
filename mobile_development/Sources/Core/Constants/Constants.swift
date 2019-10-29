//
//  Constants.swift
//  mobile_development
//
//  Created by Владимир Нереуца on 24.11.2018.
//  Copyright © 2018 Владимир Нереуца. All rights reserved.
//

import Foundation

enum Constants {
  
  static let githubUrl = "https://github.com/login/oauth/authorize?scope=nil&client_id=\(ApiConstants.clientId)"
  static let gh_safariViewService = "com.apple.SafariViewService"
  
  static let state = "\(State.self)"
  
}

enum AnimationDuration {
  
  /// 0.55
  static let middle = 0.55
  
  /// 0.35
  static let normal = 0.35
  
}

//
//  AppDelegate.swift
//  mobile_development
//
//  Created by Владимир Нереуца on 12/11/2018.
//  Copyright © 2018 Владимир Нереуца. All rights reserved.
//

import UIKit
import YandexMapKit
import GitHubOAuthController

var globalToken: String?

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    YMKMapKit.setApiKey(ApiConstants.yandexMapApiKey)
    RealmController.shared.setup()
    configureOAuth()
    
    if UserPreferencesEntity.value.currentUser == nil {
      mainRealm.realmWrite {
        UserPreferencesEntity.value.updateUser(currentUser: UserEntity.initStartUser())
      }
    }
    globalToken = CurrentUser.token
    
    return true
  }
  
  private func configureOAuth() {
    guard let array = Bundle.main.object(forInfoDictionaryKey: "CFBundleURLTypes") as? [[String: Any]],
          let dictionary = array.first,
          let schemes = dictionary["CFBundleURLSchemes"] as? [String],
          let scheme = schemes.first else {
        return
    }
    
    let redirectUri = "\(scheme)://"
    GitHubOAuthController.sharedInstance()?.configureForSafariViewController(withClientId: ApiConstants.clientId,
                                                                             clientSecret: ApiConstants.clientSecret,
                                                                             redirectUri: redirectUri,
                                                                             scope: ApiConstants.scope)
  }
  
}


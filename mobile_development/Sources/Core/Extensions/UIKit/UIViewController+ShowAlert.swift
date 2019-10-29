//
//  UIViewController+ShowAlert.swift
//  mobile_development
//
//  Created by Владимир Нереуца on 13.11.2018.
//  Copyright © 2018 Владимир Нереуца. All rights reserved.
//

import UIKit

extension UIViewController {
  
  func showOkAlertWith(message: String, completion: (() -> Void)? = nil) {
    showOkAlertWith(title: nil, message: message, completion: completion)
  }
  
  func showOkAlertWith(title: String?, message: String?, completion: (() -> Void)? = nil) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
      completion?()
    }
    alert.addAction(okAction)
    
    present(alert, animated: true, completion: nil)
  }
  
}

//
//  StoryboardInstantiatable.swift
//  mobile_development
//
//  Created by Владимир Нереуца on 05.12.2018.
//  Copyright © 2018 Владимир Нереуца. All rights reserved.
//

import UIKit

public protocol StoryboardInstantiatable: class {
  static var storyboardId: String { get }
  static var storyboardName: String { get }
}

extension StoryboardInstantiatable where Self: UIViewController {
  public static var storyboardId: String {
    return String(describing: self)
  }
  
  public static func instantiateFromStoryboard(inBundle storyboardBundle: Bundle = Bundle.main) -> Self {
    let identifier = self.storyboardId
    let storyboard = UIStoryboard(name: storyboardName, bundle: storyboardBundle)
    
    let viewController = storyboard.instantiateViewController(withIdentifier: identifier) as! Self
    return viewController
  }
}

enum StoryboardNamed: CustomStringConvertible {
  case main
  
  var description: String {
    switch self {
    case .main: return "Main"
    }
  }
}

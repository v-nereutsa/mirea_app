//
//  LoginViewController.swift
//  mobile_development
//
//  Created by Владимир Нереуца on 23.11.2018.
//  Copyright © 2018 Владимир Нереуца. All rights reserved.
//

import UIKit
import GitHubOAuthController

class LoginViewController: UIViewController {
  
  // MARK: IBOutlets
  @IBOutlet private var loginButton: UIButton!
  
  // MARK: Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    configureUI()
  }
  
  // MARK: IBActions
  @IBAction private func loginToGithub(_ sender: UIButton) {
    let githubController = GitHubOAuthController(clientId: ApiConstants.clientId,
                                                 clientSecret: ApiConstants.clientSecret,
                                                 scope: ApiConstants.scope, success: { accessToken, dictionary in
                                                  guard let token = accessToken else { return }
                                                  globalToken = token
                                                  mainRealm.realmWrite {
                                                    CurrentUser.token = token
                                                    CurrentUser.state = State.loggedIn.rawValue
                                                  }
                                                  let dictionary = [Constants.state: State.loggedIn]
                                                  NotificationCenter.default.post(name: .StateUserLogInNotification,
                                                                                  object: nil, userInfo: dictionary)
    }, failure: nil)
    
    githubController?.showModal(from: self)
  }
  
  // MARK: Methods
  private func configureUI() {
    loginButton.layer.cornerRadius = 8
    loginButton.backgroundColor = UIColor(.green)
    loginButton.setTitleColor(UIColor(.white), for: .normal)
    loginButton.setTitle(translateFor(key: .LoginLoginButton).uppercased(), for: .normal)
  }
  
}

// MARK: - StoryboardInstantiatable
extension LoginViewController: StoryboardInstantiatable {
  
  static var storyboardName: String {
    return StoryboardNamed.main.description
  }
  
}

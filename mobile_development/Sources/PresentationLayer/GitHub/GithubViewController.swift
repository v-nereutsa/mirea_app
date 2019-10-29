//
//  GithubViewController.swift
//  mobile_development
//
//  Created by Владимир Нереуца on 05.12.2018.
//  Copyright © 2018 Владимир Нереуца. All rights reserved.
//

import UIKit

class GithubViewController: UIViewController {
  
  enum Source {
    case fromTabBar
    case afterController
  }
  
  // MARK: Properties
  private var state: State = .loggedOut
  private var loginControllerView: UIView!
  private var repoListControllerView: UIView!
  private var repoListWasShown: Bool = true
  
  // MARK: Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "GitHub"
    
    addChildControllers()
    addObservers()
    navigationController?.navigationBar.prefersLargeTitles = true
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    state.value = CurrentUser.state
    
    switch state {
    case .loggedIn: showRepoList()
    case .loggedOut: showLogin()
    case .error:
      break
    }
    
  }
  
  deinit {
    NotificationCenter.default.removeObserver(self)
  }
  
  // MARK: Methods
  private func addChildControllers() {
    let loginController = LoginViewController.instantiateFromStoryboard()
    let repoListController = RepoListViewController.instantiateFromStoryboard()
    
    addChild(loginController)
    addChild(repoListController)
    
    loginControllerView = loginController.view
    repoListControllerView = repoListController.view
  }
  
  private func addObservers() {
    NotificationCenter.default.addObserver(self, selector: #selector(handleState),
                                           name: .StateUserLogInNotification,
                                           object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(handleState),
                                           name: .StateUserLogOutNotification,
                                           object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(handleState),
                                           name: .StateUserErrorNotification,
                                           object: nil)
  }
  
  private func showLogin(source: Source = .fromTabBar) {
    if view.subviews.contains(repoListControllerView) {
      repoListControllerView.removeFromSuperview()
    }
    
    view.addSubview(loginControllerView)
    if source == .afterController {
      loginControllerView.alpha = 0
      UIView.animate(withDuration: AnimationDuration.normal) {
        self.loginControllerView.alpha = 1
      }
    }
    loginControllerView.pinEdgesToSuperviewEdges()
    
    navigationItem.rightBarButtonItem = nil
  }
  
  private func showRepoList() {
    loginControllerView.removeFromSuperview()
    
    view.addSubview(repoListControllerView)
    if repoListWasShown == false {
      repoListControllerView.alpha = 0
      UIView.animate(withDuration: AnimationDuration.middle, animations: {
        self.repoListControllerView.alpha = 1
      }) { _ in
        self.repoListWasShown = true
      }
    }
    repoListControllerView.pinEdgesToSuperviewEdges()
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: translateFor(key: .RepositoriesLogOutButton),
                                                        style: .plain, target: self, action: #selector(logOut))
  }
  
  @objc private func logOut() {
    NotificationCenter.default.post(name: .StateUserLogOutNotification, object: nil,
                                    userInfo: [Constants.state: State.loggedOut])
    
    UIView.animate(withDuration: AnimationDuration.middle, animations: {
      self.repoListControllerView.alpha = 0
    }) { _ in
      self.repoListControllerView.removeFromSuperview()
      self.showLogin(source: .afterController)
      self.repoListControllerView.alpha = 1
      self.repoListWasShown = false
    }
    
    globalToken = nil
    mainRealm.realmWrite {
      CurrentUser.token = globalToken
      CurrentUser.state = state.value
    }
  }
  
  @objc private func handleState(_ notification: Notification) {
    guard let userInfo = notification.userInfo as? [String: State], let state = userInfo[Constants.state] else {
      assertionFailure("check userInfo")
      return
    }
    
    self.state = state
  }
  
}

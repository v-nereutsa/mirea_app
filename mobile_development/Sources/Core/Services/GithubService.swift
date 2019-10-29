//
//  GithubService.swift
//  mobile_development
//
//  Created by Владимир Нереуца on 02.12.2018.
//  Copyright © 2018 Владимир Нереуца. All rights reserved.
//

import GithubAPI

class GithubService {
  
  static func getRepoList(_ completion: @escaping ([RepositoryResponse]) -> ()) {
    guard let token = globalToken else {
      assertionFailure("no global token")
      return
    }
    RepositoriesAPI(authentication: AccessTokenAuthentication(access_token: token)).repositories { response, error in
      guard error == nil, let repoList = response else { return }
      completion(repoList)
    }
  }
  
  private init() { }
  
}

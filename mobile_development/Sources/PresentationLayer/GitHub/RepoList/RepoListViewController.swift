//
//  RepoListViewController.swift
//  mobile_development
//
//  Created by Владимир Нереуца on 12/11/2018.
//  Copyright © 2018 Владимир Нереуца. All rights reserved.
//

import UIKit
import GithubAPI

class RepoListViewController: UIViewController {
  
  // MARK: IBOutlet
  @IBOutlet private var tableView: UITableView!
  
  // MARK: Properties
  private var repoList: [RepositoryResponse] = []
  private var loginView: UIView?
  
  // MARK: Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    NotificationCenter.default.addObserver(self, selector: #selector(logOutAction), name: .StateUserLogOutNotification,
                                           object: nil)
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    repoList.removeAll()
    tableView.reloadData()
    
    GithubService.getRepoList { repoList in
      DispatchQueue.main.async { [weak self] in
        guard let self = self else {
          return
        }
        self.tableView.beginUpdates()
        for (index, _) in repoList.enumerated() {
          self.repoList.append(repoList[index])
          self.tableView.insertRows(at: [IndexPath(row: index, section: 0)], with: .top)
        }
        self.tableView.endUpdates()
      }
    }
    
  }
  
  deinit {
    NotificationCenter.default.removeObserver(self)
  }
  
  // MARK: Methods
  @objc private func logOutAction() {
    repoList.removeAll()
  }
  
  private func configureUI() { }
  
}

// MARK: - UITableViewDataSource
extension RepoListViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return repoList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    let repo = repoList[indexPath.row]
    cell.textLabel?.text = repo.name
    return cell
  }
  
}

// MARK: - UITableViewDelegate
extension RepoListViewController: UITableViewDelegate { }

//  MARK: StoryboardInstantiatable
extension RepoListViewController: StoryboardInstantiatable {
  
  static var storyboardName: String {
    return StoryboardNamed.main.description
  }
  
}

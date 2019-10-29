//
//  DeviceInfoViewController.swift
//  mobile_development
//
//  Created by Владимир Нереуца on 19/11/2018.
//  Copyright © 2018 Владимир Нереуца. All rights reserved.
//

import UIKit

class DeviceInfoViewController: UIViewController {
  
  // MARK: Properties
  private let deviceInfoModel = DeviceInfoModel()
  private var information: [DeviceInformation] = []
  
  // MARK: Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = translateFor(key: .AboutTitle)
    deviceInfoModel.requestDeviceInfo { [weak self] response in
      guard let self = self, let response = response else {
        return
      }
      self.information = response
    }
  }
  
  // MARK: IBActions
  @IBAction private func doneButtonAction(_ sender: UIBarButtonItem) {
    dismiss(animated: true, completion: nil)
  }
  
}

// MARK: - UITableViewDataSource
extension DeviceInfoViewController: UITableViewDataSource {

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return information.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "DeviceInfoCell", for: indexPath) as? DeviceInfoCell else {
      return UITableViewCell()
    }
    
    let info = information[indexPath.row]
    cell.configure(withInformation: info)
    
    return cell
  }
  
}

// MARK: - UITableViewDelegate
extension DeviceInfoViewController: UITableViewDelegate { }

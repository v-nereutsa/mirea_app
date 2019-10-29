//
//  DeviceInfoCell.swift
//  mobile_development
//
//  Created by Владимир Нереуца on 19/11/2018.
//  Copyright © 2018 Владимир Нереуца. All rights reserved.
//

import UIKit

class DeviceInfoCell: UITableViewCell {
  
  func configure(withInformation information: DeviceInformation) {
    textLabel?.text = information.specificationName
    detailTextLabel?.text = information.value
  }
  
}

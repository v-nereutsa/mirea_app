//
//  ContactsCell.swift
//  mobile_development
//
//  Created by Владимир Нереуца on 14.11.2018.
//  Copyright © 2018 Владимир Нереуца. All rights reserved.
//

import UIKit

class ContactsCell: UITableViewCell {
  
  func configure(withContact contact: Contact) {
    textLabel?.text = contact.fullName
    detailTextLabel?.text = contact.phoneNumber
  }
  
}

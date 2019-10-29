//
//  ContactsViewController.swift
//  mobile_development
//
//  Created by Владимир Нереуца on 13.11.2018.
//  Copyright © 2018 Владимир Нереуца. All rights reserved.
//

import UIKit
import Contacts

class ContactsViewController: UIViewController {
  
  // MARK: IBOutlets
  @IBOutlet private var tableView: UITableView!
  
  // MARK: Properties
  private var contacts: [Contact] = []
  private let contactsModel = ContactsModel()
  
  // MARK: Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    displayContacts()
    title = translateFor(key: .ContactsTitle)
  }
  
  // MARK: Methods
  private func displayContacts() {
    ContactsService.fetchContacts { isGranted, error in
      guard error == nil else { return }
      
      if isGranted {
        self.getContacts()
      } else {
        self.showOkAlertWith(title: translateFor(key: .ContactsNoAccessToContacts),
                             message: translateFor(key: .ContactsGoToSettingAndTurnOnAccessToContacts))
      }
    }
    
  }
  
  private func getContacts() {
    contactsModel.requestContacts { [weak self] response in
      guard let self = self, let response = response else {
        return
      }
      self.contacts = response
    }
    
    self.contacts.sort { $0.fullName.lowercased() < $1.fullName.lowercased() }
    DispatchQueue.main.async { [weak self] in
      guard let self = self else { return }
      self.tableView.reloadData()
    }
  }
  
}

// MARK: - UITableViewDataSource
extension ContactsViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return contacts.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(ContactsCell.self)",
                                                   for: indexPath) as? ContactsCell else {
      return UITableViewCell()
    }
    
    let contact = contacts[indexPath.row]
    cell.configure(withContact: contact)
    
    return cell
  }
  
}

// MARK: - UITableViewDelegate
extension ContactsViewController: UITableViewDelegate { }

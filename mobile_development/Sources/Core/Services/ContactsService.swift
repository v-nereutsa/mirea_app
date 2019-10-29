//
//  ContactsService.swift
//  mobile_development
//
//  Created by Владимир Нереуца on 02.12.2018.
//  Copyright © 2018 Владимир Нереуца. All rights reserved.
//

import Contacts

class ContactsService {
  
  static func fetchContacts(_ completion: @escaping(_ accessGranted: Bool, _ error: Error?) -> ()) {
    let store = CNContactStore()
    
    store.requestAccess(for: .contacts) { isGranted, error in
      guard error == nil else {
        completion(false, error)
        return
      }
      
      completion(true, nil)
    }
  }
  
  private init() { }
  
}

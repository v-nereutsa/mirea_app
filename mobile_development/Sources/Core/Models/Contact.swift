//
//  Contact.swift
//  mobile_development
//
//  Created by Владимир Нереуца on 13.11.2018.
//  Copyright © 2018 Владимир Нереуца. All rights reserved.
//

import Contacts

struct Contact {
  
  let firstName: String
  let lastName: String
  let phoneNumber: String
  
  var fullName: String {
    return firstName + " " + lastName
  }
  
  init(withContact contact: CNContact) {
    firstName = contact.givenName
    lastName = contact.familyName
    phoneNumber = contact.phoneNumbers.first?.value.stringValue ?? "No number"
  }
  
}

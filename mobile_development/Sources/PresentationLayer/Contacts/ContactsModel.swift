//
//  ContactsModel.swift
//  mobile_development
//
//  Created by Владимир Нереуца on 01/12/2018.
//  Copyright © 2018 Владимир Нереуца. All rights reserved.
//
import Contacts

class ContactsModel {
  
  func requestContacts(completion: @escaping ([Contact]?) -> () ) {
    let store = CNContactStore()
    var contacts: [Contact] = []
    let keys = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey]
    let request = CNContactFetchRequest(keysToFetch: keys as [CNKeyDescriptor])
    
    do {
      try store.enumerateContacts(with: request) { contact, stopPointIfYouWantToStopEnumeration in
        contacts.append(Contact(withContact: contact))
      }
      completion(contacts)
    } catch {
      print("Failed to enumerate contacts: \(error)")
    }
  }
  
}

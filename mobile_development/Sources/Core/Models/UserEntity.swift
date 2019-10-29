//
//  UserEntity.swift
//  mobile_development
//
//  Created by Владимир Нереуца on 29.11.2018.
//  Copyright © 2018 Владимир Нереуца. All rights reserved.
//

import RealmSwift

final class UserEntity: Object {
  
  @objc dynamic var id = 0
  @objc dynamic var name: String = ""
  @objc dynamic var token: String? = nil
  @objc dynamic var state: String = "\(State.loggedOut.rawValue)"
  
  override static func primaryKey() -> String? {
    return "id"
  }
  
  static func initStartUser() -> UserEntity {
    return UserEntity()
  }
  
}

final class UserPreferencesEntity: Object, ObjectSingletone {
  
  @objc private(set) dynamic var currentUser: UserEntity!
  
  func updateUser(currentUser: UserEntity) {
    self.currentUser = currentUser
  }
  
}

var CurrentUser: UserEntity = UserPreferencesEntity.value.currentUser

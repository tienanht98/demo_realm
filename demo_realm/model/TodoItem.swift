//
//  Item.swift
//  demo_realm
//
//  Created by Tran Tien Anh on 3/22/20.
//  Copyright © 2020 Tran_Tien_Anh. All rights reserved.
//

import Foundation
import RealmSwift
class TodoItem: Object {
   @objc dynamic var detail = ""
   @objc dynamic var status = 0
}

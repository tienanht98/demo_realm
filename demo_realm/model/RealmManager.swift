//
//  RealmManager.swift
//  demo_realm
//
//  Created by Tran Tien Anh on 3/22/20.
//  Copyright © 2020 Tran_Tien_Anh. All rights reserved.
//

import Foundation
import RealmSwift
class RealmManager {
     let  realm : Realm = try! Realm()
    private static var instance = RealmManager()
    public static func getInstance() ->RealmManager{
        return .instance
    }
}

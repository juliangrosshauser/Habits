//
//  Habit.swift
//  Habits
//
//  Created by Julian Grosshauser on 27/09/15.
//  Copyright © 2015 Julian Grosshauser. All rights reserved.
//

import Foundation
import RealmSwift

class Habit: Object {
    //MARK: Properties

    dynamic var id = NSUUID().UUIDString
    dynamic var name = ""

    //MARK: Initialization

    convenience init(name: String) {
        self.init()
        self.name = name
    }

    //MARK: Object

    override static func primaryKey() -> String? {
        return "id"
    }
}

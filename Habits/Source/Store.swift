//
//  Store.swift
//  Habits
//
//  Created by Julian Grosshauser on 27/09/15.
//  Copyright © 2015 Julian Grosshauser. All rights reserved.
//

import RealmSwift

typealias Habits = Results<Habit>

class Store {
    //MARK: Properties

    let realm = try! Realm()

    var habits: Habits {
        return realm.objects(Habit)
    }
}

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

    private let realm: Realm

    var habits: Habits {
        return realm.objects(Habit)
    }

    //MARK: Initialization

    init(realm: Realm) {
        self.realm = realm
    }

    //MARK: Managing Habits

    func addHabit(habit: Habit) {
        realm.write { [unowned self] in
            self.realm.add(habit)
        }
    }

    func deleteHabit(habit: Habit) {
        realm.write { [unowned self] in
            self.realm.delete(habit)
        }
    }
}

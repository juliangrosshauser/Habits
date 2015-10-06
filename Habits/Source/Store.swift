//
//  Store.swift
//  Habits
//
//  Created by Julian Grosshauser on 27/09/15.
//  Copyright © 2015 Julian Grosshauser. All rights reserved.
//

import Foundation
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

    func addHabit(name: String) -> NSIndexPath {
        let habit = Habit(name: name)

        realm.write { [unowned self] in
            self.realm.add(habit)
        }

        return NSIndexPath(forItem: habits.count, inSection: 0)
    }

    func deleteHabit(habit: Habit) {
        realm.write { [unowned self] in
            self.realm.delete(habit)
        }
    }
}

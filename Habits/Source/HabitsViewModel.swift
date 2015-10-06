//
//  HabitsViewModel.swift
//  Habits
//
//  Created by Julian Grosshauser on 26/09/15.
//  Copyright © 2015 Julian Grosshauser. All rights reserved.
//

import ReactiveCocoa

class HabitsViewModel {
    
    //MARK: Properties
    
    private let store: Store
    
    var habits: Habits {
        return store.habits
    }

    let addHabitEnabled = MutableProperty(true)
    let deleteHabitEnabled = MutableProperty(true)

    private(set) var addHabit: Action<String, NSIndexPath, NoError>!
    private(set) var deleteHabit: Action<PrimaryKey, NSIndexPath, StoreError>!

    //MARK: Initialization

    init(store: Store) {
        self.store = store

        addHabit = Action(enabledIf: addHabitEnabled) { [unowned self] name in
            self.addHabit(name)
        }

        deleteHabit = Action(enabledIf: deleteHabitEnabled) { [unowned self] primaryKey in
            self.deleteHabit(primaryKey)
        }
    }

    //MARK: Manage Habits

    private func addHabit(name: String) -> SignalProducer<NSIndexPath, NoError> {
        return SignalProducer(value: store.addHabit(name))
    }

    private func deleteHabit(primaryKey: PrimaryKey) -> SignalProducer<NSIndexPath, StoreError> {
        return SignalProducer(result: store.deleteHabit(primaryKey))
    }
}

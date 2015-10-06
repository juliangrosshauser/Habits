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

    //MARK: Initialization

    init(store: Store) {
        self.store = store
    }

    //MARK: Manage Habits

    private func addHabit(name: String) -> SignalProducer<NSIndexPath, NoError> {
        return SignalProducer(value: store.addHabit(name))
    }
}

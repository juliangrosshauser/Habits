//
//  HabitsCell.swift
//  Habits
//
//  Created by Julian Grosshauser on 27/09/15.
//  Copyright © 2015 Julian Grosshauser. All rights reserved.
//

import UIKit

class HabitsCell: UITableViewCell {
    func configure(habit: Habit) {
        textLabel?.text = habit.name
    }
}

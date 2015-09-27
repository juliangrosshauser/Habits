//
//  HabitsDataSource.swift
//  Habits
//
//  Created by Julian Grosshauser on 27/09/15.
//  Copyright © 2015 Julian Grosshauser. All rights reserved.
//

import UIKit

class HabitsDataSource: NSObject, UITableViewDataSource {
    //MARK: Properties

    let viewModel: HabitsViewModel

    //MARK: Initialization

    init(viewModel: HabitsViewModel) {
        self.viewModel = viewModel
        super.init()
    }

    //MARK: UITableViewDataSource

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.habits.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(String(HabitsCell)) as! HabitsCell
        cell.configure(viewModel.habits[indexPath.row])
        return cell
    }
}

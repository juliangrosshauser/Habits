//
//  HabitsController.swift
//  Habits
//
//  Created by Julian Grosshauser on 26/09/15.
//  Copyright © 2015 Julian Grosshauser. All rights reserved.
//

import UIKit

class HabitsController: UITableViewController {
    //MARK: Properties

    let viewModel: HabitsViewModel

    //MARK: Initialization

    init(viewModel: HabitsViewModel, dataSource: HabitsDataSource) {
        self.viewModel = viewModel
        super.init(style: .Plain)
        tableView.dataSource = dataSource
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerClass(HabitsCell.self, forCellReuseIdentifier: String(HabitsCell))
    }
}

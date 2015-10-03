//
//  HabitsController.swift
//  Habits
//
//  Created by Julian Grosshauser on 26/09/15.
//  Copyright © 2015 Julian Grosshauser. All rights reserved.
//

import UIKit

class HabitsController: UICollectionViewController {
    //MARK: Properties

    let viewModel: HabitsViewModel

    //MARK: Initialization

    init(viewModel: HabitsViewModel, dataSource: HabitsDataSource) {
        self.viewModel = viewModel
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
        collectionView?.dataSource = dataSource
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.registerClass(HabitsCell.self, forCellWithReuseIdentifier: String(HabitsCell))
    }
}

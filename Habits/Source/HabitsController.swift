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

    init(viewModel: HabitsViewModel) {
        self.viewModel = viewModel
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.registerClass(HabitsCell.self, forCellWithReuseIdentifier: String(HabitsCell))
    }

    //MARK: UICollectionViewDataSource

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.habits.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(String(HabitsCell), forIndexPath: indexPath) as! HabitsCell
        cell.configure(viewModel.habits[indexPath.row])
        return cell
    }
}

//
//  AppDelegate.swift
//  Habits
//
//  Created by Julian Grosshauser on 26/09/15.
//  Copyright © 2015 Julian Grosshauser. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow? = {
        let window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window.backgroundColor = .whiteColor()
        return window
    }()

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        let realm = try! Realm()
        let store = Store(realm: realm)
        let habitsViewModel = HabitsViewModel(store: store)
        let habitsController = HabitsController(viewModel: habitsViewModel)
        let navigationController = UINavigationController(rootViewController: habitsController)

        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }
}

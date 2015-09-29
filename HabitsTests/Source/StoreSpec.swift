//
//  StoreSpec.swift
//  HabitsTests
//
//  Created by Julian Grosshauser on 26/09/15.
//  Copyright © 2015 Julian Grosshauser. All rights reserved.
//

import Quick
import Nimble
import RealmSwift
@testable import Habits

class StoreSpec: QuickSpec {
    override func spec() {
        var store: Store!
        var realm: Realm!

        beforeSuite {
            do {
                realm = try Realm(configuration: Realm.Configuration(inMemoryIdentifier: "StoreSpec"))
                store = Store(realm: realm)
            } catch {
                XCTFail("Failed to initialize Realm: \(error)")
            }
        }

        describe("Store") {
            beforeEach {
                // Make sure Realm is empty before every test
                realm.write {
                    realm.deleteAll()
                }
            }
        }
    }
}

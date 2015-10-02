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

            describe("habits") {
                context("Database contains objects") {
                    var habits: [Habit]!

                    beforeEach {
                        habits = [Habit(name: "Habit1"), Habit(name: "Habit2"), Habit(name: "Habit3")]

                        realm.write {
                            realm.add(habits)
                        }
                    }

                    it("returns all Habit objects in database") {
                        // Can't be directly compared, because `store.habits` is of type `Results<Habit>` and `habits` of type `[Habit]`

                        expect(store.habits).to(haveCount(habits.count))

                        for (index, habit) in habits.enumerate() {
                            expect(habit) == store.habits[index]
                        }
                    }
                }

                context("Database contains no Habit objects") {
                    it("returns no objects") {
                        expect(store.habits).to(haveCount(0))
                    }
                }
            }

            describe("addHabit") {
                var habit: Habit!

                beforeEach {
                    habit = Habit(name: "Habit")

                    // Make sure this object isn't already in the database
                    expect(realm.objectForPrimaryKey(Habit.self, key: habit.id)).to(beNil())
                }

                it("adds Habit object to database") {
                    store.addHabit(habit)
                    expect(realm.objectForPrimaryKey(Habit.self, key: habit.id)).toNot(beNil())
                }
            }

            describe("deleteHabit") {
                var habit: Habit!

                // We need to store the primary key separately, because we can't access `habit`'s `id` property after it got deleted
                var primaryKey: String!

                beforeEach {
                    habit = Habit(name: "Habit")
                    primaryKey = habit.id

                    realm.write {
                        realm.add(habit)
                    }

                    // Make sure this object is in the database
                    expect(realm.objectForPrimaryKey(Habit.self, key: primaryKey)).toNot(beNil())
                }

                it("deletes Habit object from database") {
                    store.deleteHabit(habit)

                    // Don't try to access `habit.id` here!
                    expect(realm.objectForPrimaryKey(Habit.self, key: primaryKey)).to(beNil())
                }
            }
        }
    }
}

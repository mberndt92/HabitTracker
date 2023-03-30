//
//  Habits.swift
//  HabitTracker
//
//  Created by Maximilian Berndt on 2023/03/30.
//

import Foundation

class Habits: ObservableObject {
    @Published var habits: [Habit] = [] {
        didSet {
            if let encoded = try? JSONEncoder().encode(habits) {
                UserDefaults.standard.set(encoded, forKey: "Habits")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Habits") {
            if let decodedItems = try? JSONDecoder().decode([Habit].self, from: savedItems) {
                habits = decodedItems
                return
            }
        }
        habits = []
    }
    
    static var test: Habits {
        let habits = [Habit.test, Habit.test, Habit.test]
        let habitList = Habits()
        habitList.habits.append(contentsOf: habits)
        return habitList
    }
}

//
//  Habit.swift
//  HabitTracker
//
//  Created by Maximilian Berndt on 2023/03/30.
//

import Foundation

struct Habit: Identifiable, Codable, Equatable {
    var id = UUID()
    let title: String
    let description: String
    var completions: Int
    
    static var test: Habit {
        return Habit(id: UUID(), title: "My Habit", description: "My Habit's Description", completions: Int.random(in: 0...10))
    }
}

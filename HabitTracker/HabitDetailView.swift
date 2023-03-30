//
//  HabitDetailView.swift
//  HabitTracker
//
//  Created by Maximilian Berndt on 2023/03/30.
//

import SwiftUI

struct HabitDetailView: View {
    
    var habit: Habit
    
    @ObservedObject var habits: Habits
    
    var body: some View {
        VStack {
            Text(habit.title)
                .font(.title.bold())
            Divider()
            Text(habit.description)
            
            VStack {
                Text("Completions")
                    .font(.title)
                HStack {
                    Text("\(habit.completions)")
                        .font(.title)
                    Button {
                        let index = habits.habits.firstIndex(of: habit)!
                        var copy = habits.habits[index]
                        copy.completions += 1
                        habits.habits[index] = copy
                    } label: {
                        Image(systemName: "plus")
                    }

                }
            }
            .padding(.vertical)
        }
        .padding()
        .navigationTitle(habit.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct HabitDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HabitDetailView(habit: Habit.test, habits: Habits.test)
    }
}

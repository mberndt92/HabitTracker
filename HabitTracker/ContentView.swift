//
//  ContentView.swift
//  HabitTracker
//
//  Created by Maximilian Berndt on 2023/03/30.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var habits = Habits()
    
    @State private var showingAddNewHabitSheet = false
    
    var body: some View {
        NavigationView {
                List {
                    ForEach(habits.habits) { habit in
                        NavigationLink {
                            HabitDetailView(habit: habit, habits: habits)
                        } label: {
                            Text("\(habit.title)")
                        }
                    }
                    .onDelete(perform: removeHabit)
                }
            .toolbar(content: {
                Button {
                    showingAddNewHabitSheet = true
                } label: {
                    Image(systemName: "plus")
                }
            })
            .sheet(isPresented: $showingAddNewHabitSheet) {
                AddHabitView(habits: habits)
            }
        }
    }
    
    private func removeHabit(for offsets: IndexSet) {
        habits.habits.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

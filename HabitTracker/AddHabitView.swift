//
//  AddHabitView.swift
//  HabitTracker
//
//  Created by Maximilian Berndt on 2023/03/30.
//

import SwiftUI

struct AddHabitView: View {
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var habits: Habits
    
    @State private var title: String = ""
    @State private var description: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Title", text: $title)
                TextField("Description", text: $description)
            }
            .navigationTitle("Add New Habit")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button("Save") {
                    let habit = Habit(title: title, description: description, completions: 0)
                    habits.habits.append(habit)
                    dismiss()
                }
            }
        }
        
    }
}

struct AddHabitView_Previews: PreviewProvider {
    static var previews: some View {
        AddHabitView(habits: Habits.test)
    }
}

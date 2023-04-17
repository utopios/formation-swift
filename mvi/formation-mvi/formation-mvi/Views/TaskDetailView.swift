//
//  TaskDetailView.swift
//  formation-mvi
//
//  Created by Ihab ABADI on 17/04/2023.
//

import Foundation
import SwiftUI
import Combine

struct TaskDetailView:View {
    @StateObject var intent: TaskListIntent
    @Environment(\.presentationMode) var presentationMode
    var task: Task
    @State private var title = ""
    @State private var isFavoris = false
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("New Task")) {
                    TextField("Title", text: $title)
                    Toggle("Favoris", isOn: $isFavoris).onChange(of: isFavoris) {
                        value in intent.process(.toggleFavoris(task.id))
                    }
                    
                }
            }.navigationBarTitle("Add Task")
                .navigationBarItems(leading: Button("Cancel"){
                    presentationMode.wrappedValue.dismiss()
                }, trailing: Button("Save") {
                    updateTask()
                })
        }.onAppear{
            title = task.title
            isFavoris = task.isFavoris
        }
    }
    
    func updateTask() {
        let updateTask = Task(id: task.id, title: title, isFavoris: isFavoris)
        intent.process(.updateTask(updateTask))
        presentationMode.wrappedValue.dismiss()
    }
}

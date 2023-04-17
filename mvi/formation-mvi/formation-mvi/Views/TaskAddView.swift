//
//  TaskAddView.swift
//  formation-mvi
//
//  Created by Ihab ABADI on 17/04/2023.
//

import Foundation
import SwiftUI

struct TaskAddView: View {
    @StateObject var intent: TaskListIntent
    @Environment(\.presentationMode) var presentationMode
    @State private var title:String = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("New Task")) {
                    TextField("Title", text: $title)
                }
            }.navigationBarTitle("Add Task")
                .navigationBarItems(leading: Button("Cancel"){
                    presentationMode.wrappedValue.dismiss()
                }, trailing: Button("Save") {
                    saveTask()
                })
        }
    }
    
    private func saveTask() {
        let newTask = Task(title: title)
        intent.process(.addTask(newTask))
        presentationMode.wrappedValue.dismiss()
    }
}

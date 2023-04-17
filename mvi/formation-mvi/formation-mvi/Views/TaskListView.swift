//
//  TaskListView.swift
//  formation-mvi
//
//  Created by Ihab ABADI on 17/04/2023.
//

import Foundation
import SwiftUI
import Combine

struct TaskListView: View {
    @StateObject var intent: TaskListIntent
    @State var isModalPresented = false
    var body: some View {
        NavigationView {
            List {
                ForEach(intent.state.tasks) {
                    task in
                    NavigationLink(destination: TaskDetailView(intent: intent, task: task)) {
                        HStack{
                            Text(task.title)
                            Spacer()
                            if task.isFavoris {
                                Image(systemName: "star.fill").foregroundColor(.red)
                            }
                        }
                    }
                }.onDelete(perform: deleteTask)
            }
            .navigationBarTitle("Tasks")
            .navigationBarItems(trailing: Button(action: {
                isModalPresented = true
            }, label: {
                Image(systemName: "plus")
            })).sheet(isPresented: $isModalPresented) {
                VStack{
                    TaskAddView(intent: intent)
                }
            }
        }
    }
    
    private func deleteTask(at offsets: IndexSet) {
        offsets.forEach{ index in
            let taskId = intent.state.tasks[index].id
            intent.process(.deleteTask(taskId))
        }
    }
}

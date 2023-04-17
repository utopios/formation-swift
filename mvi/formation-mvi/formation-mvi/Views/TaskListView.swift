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
    var body: some View {
        VStack {
            List {
                ForEach(intent.state.tasks) {
                    task in HStack{
                        Text(task.title)
                        Spacer()
                    }
                }.onDelete(perform: deleteTask)
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

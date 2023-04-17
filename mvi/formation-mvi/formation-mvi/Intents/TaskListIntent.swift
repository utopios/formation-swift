//
//  TaskListIntent.swift
//  formation-mvi
//
//  Created by Ihab ABADI on 17/04/2023.
//

import Foundation


//Etat
struct TaskListState {
    var tasks: [Task] = []
}

//Evenements

enum TaskListEvent {
    case addTask(Task)
    case deleteTask(UUID)
}

//Intention

class TaskListIntent : ObservableObject {
    @Published private(set) var state = TaskListState()
    
    init() {
        state.tasks.append(Task(title: "task 1"))
        state.tasks.append(Task(title: "task 2"))
    }
    
    
    func process(_ event: TaskListEvent) {
        switch event {
        case .addTask(let task):
            state.tasks.append(task)
        case .deleteTask(let taskId):
            state.tasks.removeAll{$0.id == taskId}
        }
        
    }
}



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
    case toggleFavoris(UUID)
    case updateTask(Task)
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
        case .toggleFavoris(let taskId):
            if let index = state.tasks.firstIndex(where: {$0.id == taskId}) {
                state.tasks[index].isFavoris.toggle()
            }
        case .updateTask(let task):
            if let index = state.tasks.firstIndex(where: {$0.id == task.id}) {
                state.tasks[index] = task
            }
        }
        
    }
}



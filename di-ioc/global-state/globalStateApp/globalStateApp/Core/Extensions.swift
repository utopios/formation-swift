//
//  Extensions.swift
//  globalStateApp
//
//  Created by Ihab ABADI on 02/05/2023.
//

import Foundation
import Combine
import SwiftUI

struct TaskRepositoryKey: EnvironmentKey {
    static let defaultValue: TaskRepository = TaskRepositoryImplementation()
}

struct TaskServiceKey: EnvironmentKey {
    static let defaultValue: TaskService = TaskServiceImpl()
}


struct TaskInteractorKey: EnvironmentKey {
    static let defaultValue: TaskInteractor = TaskInteractorImpl()
}

extension EnvironmentValues {
    var taskRepository : TaskRepository {
        get {self[TaskRepositoryKey.self]}
        set {self[TaskRepositoryKey.self] = newValue}
    }
    
    var taskService : TaskService {
        get {self[TaskServiceKey.self]}
        set {self[TaskServiceKey.self] = newValue}
    }
    
    var taskInteractor: TaskInteractor {
        get {self[TaskInteractorKey.self]}
        set {self[TaskInteractorKey.self] = newValue}
    }
}

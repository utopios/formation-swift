//
//  ContentViewIoC.swift
//  DiANDIoC
//
//  Created by Ihab ABADI on 02/05/2023.
//

import Foundation
import Combine
import SwiftUI
protocol TaskService {
    func fetchTask() -> AnyPublisher<[Task], Error>
}

class TaskServiceImpl : TaskService {
    @Environment(\.taskRepository) private var taskRepository: TaskRepository
    func fetchTask() -> AnyPublisher<[Task], Error> {
        return taskRepository.fetchData()
    }
    
    
}


protocol TaskInteractor {
    func fetchTask() -> AnyPublisher<[Task], Error>
}

class TaskInteractorImpl : TaskInteractor {
    @Environment(\.taskservice) private var taskService: TaskService
    func fetchTask() -> AnyPublisher<[Task], Error> {
        return taskService.fetchTask()
    }
    
    
}



class TaskIoCViewModel : ObservableObject {
    @Environment(\.taskservice) private var taskService: TaskService
    @Published private(set) var tasks:[Task] = []
    
    init() {
        
    }
}

struct ContentViewIoC : View {
    @ObservedObject private var taskIoCViewModel:TaskIoCViewModel  = TaskIoCViewModel()
    var body: some View {
        VStack {
            
        }
    }
}

struct TaskRepositoryKey: EnvironmentKey {
    static let defaultValue: TaskRepository = TaskRepositoryImplementation()
}

struct TaskServiceKey: EnvironmentKey {
    static let defaultValue: TaskService = TaskServiceImpl()
}

extension EnvironmentValues {
    var taskRepository : TaskRepository {
        get {self[TaskRepositoryKey.self]}
        set {self[TaskRepositoryKey.self] = newValue}
    }
    
    var taskservice : TaskService {
        get {self[TaskServiceKey.self]}
        set {self[TaskServiceKey.self] = newValue}
    }
}





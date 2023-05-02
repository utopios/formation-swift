//
//  TaskService.swift
//  globalStateApp
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

//
//  TaskInteractor.swift
//  globalStateApp
//
//  Created by Ihab ABADI on 02/05/2023.
//

import Foundation
import Combine
import SwiftUI
protocol TaskInteractor {
    func fetchData() -> AnyPublisher<[Task], Error>
}


class TaskInteractorImpl: TaskInteractor {
    func fetchData() -> AnyPublisher<[Task], Error> {
        return taskService.fetchTask()
    }
    
    @Environment(\.taskService) var taskService: TaskService
    
}

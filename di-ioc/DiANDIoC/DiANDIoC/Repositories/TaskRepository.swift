//
//  TaskRepository.swift
//  DiANDIoC
//
//  Created by Ihab ABADI on 02/05/2023.
//

import Foundation
import Combine
protocol TaskRepository {
    func fetchData() -> AnyPublisher<[Task], Error>
}


class TaskRepositoryImplementation: TaskRepository {
    func fetchData() -> AnyPublisher<[Task], Error> {
        let data = [
            Task(title: "task 1"),
            Task(title: "task 2")
        ]
        
        return Just(data).setFailureType(to: Error.self).eraseToAnyPublisher()
    }
    
    
}

//
//  TaskViewModels.swift
//  DiANDIoC
//
//  Created by Ihab ABADI on 02/05/2023.
//

import Foundation

protocol TaskViewModelProtocol {
    var tasks:[Task] {get set}
    var error: Error? {get set}
}


class TaskViewModel: ObservableObject, TaskViewModelProtocol {
    @Published var tasks: [Task] = []
    @Published var error: Error? = nil
    
    var taskRepository:TaskRepository
    
    init(taskRepository: TaskRepository) {
        self.taskRepository = taskRepository
        self.taskRepository.fetchData().receive(on: DispatchQueue.main).sink(receiveCompletion: {[weak self] completion in
            switch completion {
            case .failure(let error):
                self?.error = error
            case .finished:
                break
            }
        }, receiveValue: {
            [weak self] tasks in
            self?.tasks = tasks
        })
    }
}

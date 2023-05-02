//
//  ContentView.swift
//  DiANDIoC
//
//  Created by Ihab ABADI on 02/05/2023.
//

import SwiftUI




struct ContentView: View {
    
    var container = DependencyContainer()
    
    init() {
        container.register(TaskRepository.self){ TaskRepositoryImplementation() }
       // container.register(TaskViewModelProtocol.self) { TaskViewModel(taskRepository: container.resolver())}
       // container.register(TaskViewModel.self) { TaskViewModel(taskRepository: container.resolver()) }
    }
    
    
    var body: some View {
        //TaskView(taskViewModel: container.resolver())
        
    }
}



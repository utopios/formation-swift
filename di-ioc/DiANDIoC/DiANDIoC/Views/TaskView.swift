//
//  TaskView.swift
//  DiANDIoC
//
//  Created by Ihab ABADI on 02/05/2023.
//

import Foundation

import SwiftUI

struct TaskView: View {
    
    
    var taskViewModel: TaskViewModel
    
    init(taskViewModel: TaskViewModel) {
        self.taskViewModel = taskViewModel
    }
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

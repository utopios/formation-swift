//
//  ContentView.swift
//  mainapp
//
//  Created by Ihab ABADI on 27/04/2023.
//

import SwiftUI
import ListFeature
import TaskAPI
struct ContentView: View {
    @StateObject private var listFeatureViewModel: ListFeatureViewModel
    
    init() {
        let taskService = TaskService()
        _listFeatureViewModel = StateObject(wrappedValue: ListFeatureViewModel(taskService: taskService))
    }
    
    var body: some View {
        NavigationView{
            VStack{
                ListFeatureView(viewModel: listFeatureViewModel)
            }
        }
        .padding()
    }
}


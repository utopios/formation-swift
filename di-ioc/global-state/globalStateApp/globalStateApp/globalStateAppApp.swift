//
//  globalStateAppApp.swift
//  globalStateApp
//
//  Created by Ihab ABADI on 02/05/2023.
//

import SwiftUI

@main
struct globalStateAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.taskInteractor, TaskInteractorImpl())
                .environment(\.taskService, TaskServiceImpl())
                .environment(\.taskRepository, TaskRepositoryImplementation())
                .environmentObject(AppState())
        }
    }
}

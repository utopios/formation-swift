//
//  DiANDIoCApp.swift
//  DiANDIoC
//
//  Created by Ihab ABADI on 02/05/2023.
//

import SwiftUI

@main
struct DiANDIoCApp: App {
    var body: some Scene {
        WindowGroup {
            //ContentView()
            ContentViewIoC().environment(\.taskRepository, TaskRepositoryImplementation())
                .environment(\.taskservice, TaskServiceImpl())
        }
    }
}

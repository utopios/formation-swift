//
//  ContentView.swift
//  globalStateApp
//
//  Created by Ihab ABADI on 02/05/2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var appState: AppState
    var body: some View {
        VStack {
            Button("Get Data") {
                appState.fetchData()
            }
            if appState.isLoading {
                ProgressView()
            }
            else {
                List(appState.tasks) {
                    task in Text(task.title)
                }
            }

        }
        .padding()
    }
}


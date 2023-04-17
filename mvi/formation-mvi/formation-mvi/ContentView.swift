//
//  ContentView.swift
//  formation-mvi
//
//  Created by Ihab ABADI on 17/04/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TaskListView(intent: TaskListIntent())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

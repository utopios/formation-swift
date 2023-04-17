//
//  File.swift
//  
//
//  Created by Ihab ABADI on 11/04/2023.
//

import Foundation
import SwiftUI

struct MainContentView<VM: MainContentViewModelProtocol & MainContentFlowStateProtocol>: View {
    @StateObject var viewModel: VM
    var body: some View {
        MainFlowCoordinator(state: viewModel, content: content)
    }
    
    @ViewBuilder private func content() -> some View {
        VStack {
            Button("First View", action: viewModel.firstAction)
            Button("second View", action: viewModel.secondAction)
            Button("third View", action: viewModel.thirdAction)
            Button("Go To Tab 2", action: viewModel.goToSecondTabAction)
        }
    }
}


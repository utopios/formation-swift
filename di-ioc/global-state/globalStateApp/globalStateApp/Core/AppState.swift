//
//  AppState.swift
//  globalStateApp
//
//  Created by Ihab ABADI on 02/05/2023.
//

import Foundation
import SwiftUI
import Combine
class AppState : ObservableObject {
    @Published var tasks:[Task] = []
    @Published var isLoading: Bool = false
    @Published var error:Error? = nil
    
    private var cancellables = Set<AnyCancellable>()
    
    @Environment(\.taskInteractor) var taskInteractor: TaskInteractor
    
    init() {
        //fetchData()
    }
    
    func fetchData() {
        isLoading = true
        taskInteractor.fetchData().receive(on: DispatchQueue.main).sink(receiveCompletion: {
            [weak self] completion in
            guard let self = self else {return}
            self.isLoading = false
            switch completion {
            case .failure(let error):
                self.error = error
            case .finished:
                break
            }
        }, receiveValue: {
            [weak self] tasks in
            self?.tasks = tasks
        }).store(in: &cancellables)
    }
    
}

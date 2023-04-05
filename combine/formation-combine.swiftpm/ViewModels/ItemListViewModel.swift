//
//  File.swift
//  
//
//  Created by Ihab ABADI on 05/04/2023.
//

import Foundation
import Combine
class ItemListViewModel: ObservableObject {
    @Published var items : [Item] = []
    var allItems: [Item] = []
    @Published var searchText = ""
    private var _cancellables:Set<AnyCancellable> = []
    
    init() {
        $searchText.debounce(for: .milliseconds(500), scheduler: RunLoop.main).sink {
            [weak self] text in
            self?._performSearch(text)
        }.store(in: &_cancellables)
    }
    
    func addItem(name: String) {
        let item = Item(name: name)
        allItems.append(item)
        _performSearch(searchText)
    }
    
    private func _performSearch(_ text:String) {
        if searchText.isEmpty {
            items = allItems
        }
        else {
            items = allItems.filter{e in e.name.lowercased().contains(text.lowercased())}
        }
    }
}

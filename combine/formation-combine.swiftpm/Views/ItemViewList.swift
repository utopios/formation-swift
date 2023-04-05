//
//  File.swift
//  
//
//  Created by Ihab ABADI on 05/04/2023.
//

import Foundation
import SwiftUI
struct ItemViewList: View {
    @State private var _newItemVal = ""
    @StateObject private var viewModel:ItemListViewModel
    
    init() {
        _viewModel = StateObject(wrappedValue:ItemListViewModel())
    }
    
    var body: some View{
        VStack {
            HStack{
                TextField("Ajouter un item", text:$_newItemVal, onCommit: {
                    viewModel.addItem(name: _newItemVal)
                    _newItemVal = ""
                }).textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: {
                    viewModel.addItem(name: _newItemVal)
                }){
                    Image(systemName: "plus.circle.fill").foregroundColor(.blue).imageScale(.large)
                }
            }.padding()
            
            TextField("Rechercher", text:$viewModel.searchText).textFieldStyle(RoundedBorderTextFieldStyle()).padding()
            
            List {
                ForEach(viewModel.items) {
                    item in Text(item.name)
                }
            }
        }
    }
}

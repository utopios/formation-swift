//
//  File.swift
//  
//
//  Created by Ihab ABADI on 11/04/2023.
//

import Foundation

protocol MainContentViewModelProtocol : ObservableObject {
    func firstAction()
    func secondAction()
    func thirdAction()
    
    var data:[String] {get}
}


class MainContentViewModel : MainContentFlowStateProtocol, MainContentViewModelProtocol {
    
    init() {
        
    }
    @Published var activeLink: ContentLink?
    
    func firstAction() {
        activeLink = .firstLinkWithArg(arg: "coucou")
    }
    
    func secondAction() {
        activeLink = .sheetLink(item: "toto")
    }
    
    func thirdAction() {
        activeLink = .thirdLink
    }
    
    @Published var data: [String] = ["toto", "tata", "titi"]
    
    
}

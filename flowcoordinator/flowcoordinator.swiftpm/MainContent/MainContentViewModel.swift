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
    
    func goToSecondTabAction()
    
    var data:[String] {get}
}


class MainContentViewModel : MainContentFlowStateProtocol, MainContentViewModelProtocol {
    
    init() {
        activeTab = .tab1
    }
    @Published var activeLink: ContentLink?
    
    @Published var activeTab: ContentLink
    
    func firstAction() {
        activeLink = .firstLinkWithArg(arg: "coucou")
    }
    
    func secondAction() {
        activeLink = .sheetLink(item: "toto")
    }
    
    func thirdAction() {
        activeLink = .thirdLink
    }
    
    func goToSecondTabAction() {
        activeTab = .tab2
    }
    
    
    @Published var data: [String] = ["toto", "tata", "titi"]
    
    
}

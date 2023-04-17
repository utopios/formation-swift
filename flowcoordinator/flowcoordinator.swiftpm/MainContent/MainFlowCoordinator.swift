//
//  File.swift
//  
//
//  Created by Ihab ABADI on 11/04/2023.
//

import Foundation
import SwiftUI


protocol MainContentFlowStateProtocol : ObservableObject {
    var activeLink: ContentLink? {get set}
    var activeTab: ContentLink {get set}
    
}

enum ContentLink: Hashable, Identifiable {
    var id: String {
        switch self {
        case .firstLink, .firstLinkWithArg:
            return "first"
        case .secondLink:
            return "second"
        case .thirdLink:
            return "third"
        case .tab1:
            return "tab1"
        case .tab2:
            return "tab2"
        case let .sheetLink(item):
            return item
            
        }
    }
    
    var navigationLink : ContentLink {
        switch self {
        case .firstLinkWithArg:
            return .firstLink
        default:
            return self
        }
    }
    
    var sheetItem: ContentLink? {
        switch self {
        case .sheetLink:
            return self
        default:
            return nil
        }
    }
    
    case firstLink
    case secondLink
    case thirdLink
    case firstLinkWithArg(arg:String)
    case sheetLink(item: String)
    case tab1
    case tab2
}

struct MainFlowCoordinator<State: MainContentFlowStateProtocol, Content:View>:View {
    
    @StateObject var state:State
    let content : () -> Content
    
    private var activeLink: Binding<ContentLink?> {
        $state.activeLink.map(get: {$0?.navigationLink}, set: {$0})
    }
    private var sheetItem: Binding<ContentLink?> {
        $state.activeLink.map(get: {$0?.sheetItem}, set: {$0})
    }
    var body: some View {
        TabView(selection: $state.activeTab) {
            NavigationView {
                VStack {
                    content().sheet(item: sheetItem, content:sheetContent)
                    navigationLinks
                }
            }.tabItem {
                Text("Tab 1")
            }.tag(ContentLink.tab1)
            NavigationView {
                VStack {
                    Text("Content of tab 2")
                    navigationLinks
                }
                
            }.tabItem {
                Text("Tab 2")
            }.tag(ContentLink.tab2)
        }
        
    }
    
    @ViewBuilder private var navigationLinks: some View {
        NavigationLink(tag: .firstLink, selection: activeLink, destination: firstDestination) {EmptyView()}
    }
    
    @ViewBuilder private func sheetContent(sheetItem: ContentLink) -> some View {
        switch sheetItem {
        case let .sheetLink(item):
           SheetView(item)
        default:
            EmptyView()
        }
    }
    
    private func firstDestination() -> some View {
        var data:String?
        if case let .firstLinkWithArg(arg) = state.activeLink {
            data = arg
        }
        let view = SecondView(data)
        return view
    }
}

struct SheetView:View {
    var data:String
    init(_ d:String) {
        data = d
    }
    var body: some View{
        VStack {
            Text(data)
        }
    }
}

extension Binding {
    
    func map<T>(get: @escaping (Value) -> T?, set: @escaping (T?) -> Value) -> Binding<T?> {
        Binding<T?>(
            get: {
                get(wrappedValue)
            },
            set: {
                wrappedValue = set($0)
            }
        )
    }
}

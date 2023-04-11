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
    
    case firstLink
    case secondLink
    case thirdLink
    case firstLinkWithArg(arg:String)
}

struct MainFlowCoordinator<State: MainContentFlowStateProtocol, Content:View>:View {
    
    @StateObject var state:State
    let content : () -> Content
    
    private var activeLink: Binding<ContentLink?> {
        $state.activeLink.map(get: {$0?.navigationLink}, set: {$0})
    }
    var body: some View {
        NavigationView {
            VStack {
                content()
                navigationLinks
            }
        }
    }
    
    @ViewBuilder private var navigationLinks: some View {
        NavigationLink(tag: .firstLink, selection: activeLink, destination: firstDestination) {EmptyView()}
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

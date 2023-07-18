//
//  ContentView.swift
//  deeplink
//
//  Created by Ihab ABADI on 18/07/2023.
//

import SwiftUI

protocol Coordinator {
    associatedtype Destination

    func navigate(to destination: Destination)
}

enum Tab {
    case home, search, settings
}

enum SettingsView {
    case main, details
}

struct DeepLink {
    let tab: Tab
    let settingsView: SettingsView?
    let targetView: any View
}

class TabCoordinator: ObservableObject {
    @Published var selectedTab: Tab = .home
    @Published var selectedSettingsView: SettingsView = .main
    @Published var selectedTargetView : any View = HomeView()

    func handle(deepLink: DeepLink) {
        selectedTab = deepLink.tab
        if let settingsView = deepLink.settingsView {
            selectedSettingsView = settingsView
        }
        
    }
}

struct ContentView: View {
    @StateObject var tabCoordinator = TabCoordinator()

    var body: some View {
        TabView(selection: $tabCoordinator.selectedTab) {
            HomeView()
                .tag(Tab.home)
                .tabItem { Label("Home", systemImage: "house") }

            SearchView()
                .tag(Tab.search)
                .tabItem { Label("Search", systemImage: "magnifyingglass") }
            
            SettingView(selectedView: $tabCoordinator.selectedSettingsView, targetView: $tabCoordinator.selectedTargetView ).tag(Tab.settings).tabItem { Label("Settings", systemImage: "gearshape") }

            
        }
        .environmentObject(tabCoordinator)
        .onOpenURL { url in
            let deepLink = parseDeepLink(from: url)
            tabCoordinator.handle(deepLink: deepLink)
        }
    }

    func parseDeepLink(from url: URL) -> DeepLink {
        let pathComponents = url.pathComponents

      
        switch pathComponents[1] {
        case "home":
            return DeepLink(tab: .home, settingsView: nil, targetView: HomeView())
        case "search":
            return DeepLink(tab: .search, settingsView: nil, targetView: SearchView())
        case "settings":
            if pathComponents.count > 2 && pathComponents[2] == "detail" {
                return DeepLink(tab: .settings, settingsView: .details, targetView: DetailView())
            } else {
                return DeepLink(tab: .settings, settingsView: nil, targetView: HomeView())
            }
        default:
            return DeepLink(tab: .home, settingsView: nil, targetView: HomeView())
        }
    }
}

struct HomeView: View {
    var body: some View {
        VStack {
            Text("Home View")
                .font(.title)
                .padding()
            Image(systemName: "house.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
        }
    }
}

struct SearchView: View {
    @State private var searchText = ""

    var body: some View {
        VStack {
            Text("Search View")
                .font(.title)
                .padding()
            TextField("Search...", text: $searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Image(systemName: "magnifyingglass")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
        }
    }
}


struct SettingView: View {
    @State private var searchText = ""
    @Binding var selectedView: SettingsView?
    @Binding var targetView: any View
    var body: some View {
        VStack {
            Text("view")
                .font(.title)
                .padding()
                NavigationLink( destination: $targetView, tag: SettingsView.details, selection: $selectedView, label: {
                Text("Go to detail")
            }).padding()
        }
    }
}

struct DetailView: View {
    

    var body: some View {
        VStack {
            Text("Detail settings View")
                .font(.title)
                .padding()
            
        }
    }
}


extension Binding {
     func toUnwrapped<T>(defaultValue: T) -> Binding<T> where Value == Optional<T>  {
        Binding<T>(get: { self.wrappedValue ?? defaultValue }, set: { self.wrappedValue = $0 })
    }
}

//
//  ContentView_TabView.swift
//  WBChatAppSUI
//
//  Created by Daria on 05.06.2024.
//

import SwiftUI



struct ContentView_TabView: View {
    //@ObservedObject var router: Router = .init()
    @StateObject var router = Router.shared
    
    var body: some View {
        TabView(selection: $router.selectedTab) {
            ContactsScreen().tabItem { Label("Контакты", systemImage: Resources.ImageTitle.SystemImage.tabBarPerson) }.tag(Tabs.contacts)
            ChatsScreen().tabItem { Label("Чаты", systemImage: Resources.ImageTitle.SystemImage.tabBarChats) }.tag(Tabs.chats)
            MoreScreen().tabItem { Label("Еще", systemImage: Resources.ImageTitle.SystemImage.tabBarMore) }.tag(Tabs.more)
        }
    }
}

struct ContentView_TabView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView_TabView()
    }
}


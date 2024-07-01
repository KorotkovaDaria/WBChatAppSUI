//
//  Router.swift
//  WBChatAppSUI
//
//  Created by Daria on 14.06.2024.
//

import Foundation

enum Tabs: Hashable {
    case contacts
    case chats
    case countries
    case emoji
    case more
}

final class Router: ObservableObject {
    
    static let shared: Router = .init()
    
    private init() {}
    
    @Published var selectedTab: Tabs = .emoji
    
    func moveToTab(tab: Tabs) {
        selectedTab = tab
    }
}

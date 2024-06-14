//
//  WalkthroughIntents.swift
//  WBChatAppSUI
//
//  Created by Daria on 14.06.2024.
//

import Foundation
import AppIntents

final class WalkthroughIntents: AppIntent {
    static var title: LocalizedStringResource = "Open chats in WBChatApp"
    
    static var openAppWhenRun: Bool = true
    
    @MainActor
    func perform() async throws -> some IntentResult {
        Router.shared.moveToTab(tab: .chats)
        return .result()
    }
}

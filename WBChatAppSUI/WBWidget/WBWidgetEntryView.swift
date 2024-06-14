//
//  WBWidgetEntryView.swift
//  WBChatAppSUI
//
//  Created by Daria on 14.06.2024.
//

import WidgetKit
import SwiftUI
import Intents


struct WBWidgetEntryView : View {
    var entry: Provider.Entry
    var countMessage: Int = 5
    
    var body: some View {
        ZStack {
            VStack {
                Text("У вас \(countMessage) непрочитанных сообщений")
                    .font(.headline)
            }
        }
    }
}

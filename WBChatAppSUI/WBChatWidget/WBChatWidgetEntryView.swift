//
//  WBChatWidgetEntryView.swift
//  WBChatAppSUI
//
//  Created by Daria on 21.06.2024.
//

import WidgetKit
import SwiftUI

struct WBChatWidgetEntryView: View {
    var entry: Provider.Entry
    
    var body: some View {
        ZStack {
            Color("Neutral_Active")
            VStack(spacing: 8) {
                HStack(spacing: 24) {
                    CirclePhoto(imageAvatar: entry.imageAvatars[0])
                    CirclePhoto(imageAvatar: entry.imageAvatars[1])
                    CirclePhoto(imageAvatar: entry.imageAvatars[2])
                    CirclePhoto(imageAvatar: entry.imageAvatars[3])
                }
                HStack(spacing: 24) {
                    CirclePhoto(imageAvatar: entry.imageAvatars[4])
                    CirclePhoto(imageAvatar: entry.imageAvatars[5])
                    CirclePhoto(imageAvatar: entry.imageAvatars[6])
                    CirclePhoto(imageAvatar: entry.imageAvatars[7])
                }
            }
        }
    }
}

struct CirclePhoto: View {
    var imageAvatar: String
    var body: some View {
        HStack {
            Image(imageAvatar)
                .resizable()
                .scaledToFill()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 1))
        }
    }
}

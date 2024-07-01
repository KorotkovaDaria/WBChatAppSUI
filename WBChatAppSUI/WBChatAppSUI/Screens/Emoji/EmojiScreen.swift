//
//  EmojiScreen.swift
//  WBChatAppSUI
//
//  Created by Daria on 05.06.2024.
//

import SwiftUI

struct Emoji: Identifiable, Equatable {
    let id = UUID()
    let value: String
}

class EmojiViewModel: ObservableObject {
    @Published var emojis: [Emoji] = []
    
    init() {
        loadMoreEmojie()
    }
    
    func loadMoreEmojie() {
        let newEmojis = (0..<20).map {_ in
            let emojiRange = Array(0x1F300...0x1F3F0)
            let randomEmoji = String(UnicodeScalar(emojiRange.randomElement()!)!)
            return Emoji(value: randomEmoji)
        }
        emojis.append(contentsOf: newEmojis)
    }
}


struct EmojiScreen: View {
    @StateObject private var viewModel = EmojiViewModel()
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.emojis) { emoji in
                    EmojiCell(emoji: emoji)
                        .onAppear {
                            if emoji == viewModel.emojis.last {
                                viewModel.loadMoreEmojie()
                            }
                        }
                }
            }
        }
    }
}

struct EmojiCell: View {
    let emoji: Emoji
    
    var body: some View {
        ZStack {
            let layout = Int.random(in: 0...3)
            switch layout {
            case 0:
                TwoRectanglesLayout(alignment: .top)
            case 1:
                TwoRectanglesLayout(alignment: .bottom)
            case 2:
                TwoRectanglesLayout(alignment: .leading)
            case 3:
                TwoRectanglesLayout(alignment: .trailing)
            default:
                EmptyView()
            }
            Text(emoji.value)
                .opacity(0.7)
                .font(.system(size: 200))
        }
        .frame(maxWidth: .infinity)
        .frame(height: 300)
    }
}

struct EmojiScreen_Previews: PreviewProvider {
    static var previews: some View {
        EmojiScreen()
    }
}

struct TwoRectanglesLayout: View {
    let alignment: Alignment
    
    var body: some View {
        Group {
            if alignment == .top || alignment == .bottom {
                VStack {
                    HStack {
                        if alignment == .top { rectangles() }
                    }
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(style: StrokeStyle(lineWidth: 3, dash: [10,2]))
                        .foregroundColor(.pink)
                    HStack {
                        if alignment == .bottom { rectangles() }
                    }
                }
            } else {
                HStack {
                    VStack {
                        if alignment == .leading { rectangles() }
                    }
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(style: StrokeStyle(lineWidth: 3, dash: [10,2]))
                        .foregroundColor(.pink)
                    VStack {
                        if alignment == .trailing { rectangles() }
                    }
                }
            }
        }
        .padding(30)
    }
    
    
    @ViewBuilder
    private func rectangles() -> some View {
        ForEach(0..<2) { _ in
            RoundedRectangle(cornerRadius: 20)
                .stroke(style: StrokeStyle(lineWidth: 3, dash: [10,2]))
        }
    }
}


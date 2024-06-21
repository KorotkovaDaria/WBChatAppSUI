//
//  WBChatWidget.swift
//  WBChatWidget
//
//  Created by Daria on 21.06.2024.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    typealias Entry = SimpleEntry
    var imageAvatarsArr = ["Photo1", "Photo2", "Photo3", "Photo4", "Photo6", "Photo7", "Photo8", "Photo9"].shuffled()
    
    func placeholder(in context: Context) -> SimpleEntry {
        Entry(date: Date(), imageAvatars: imageAvatarsArr)
    }

    func getSnapshot(in context: Context, completion: @escaping (Entry) -> ()) {
        let entry = SimpleEntry(date: Date(), imageAvatars: imageAvatarsArr)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [Entry] = []
        
        let currentDate = Date()
        for minutOffset in 0..<10 {
            let entryDate = Calendar.current.date(byAdding: .minute, value: minutOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, imageAvatars: imageAvatarsArr)
            entries.append(entry)
        }
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let imageAvatars: [String]
}

struct WBChatWidget: Widget {
    let kind: String = "WBChatWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            WBChatWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Widget WBChat with contacts")
        .description("This widget shows user avatars, when clicked, they go to the contacts page.")
        .supportedFamilies([.systemMedium])
    }
}

struct WBChatWidget_Previews: PreviewProvider {
    static var previews: some View {
        WBChatWidgetEntryView(entry: SimpleEntry(date: Date(), imageAvatars: ["Photo1", "Photo2", "Photo3", "Photo4", "Photo6", "Photo7", "Photo8", "Photo9"].shuffled()))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}

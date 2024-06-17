//
//  WBWidget.swift
//  WBWidget
//
//  Created by Daria on 14.06.2024.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    typealias Entry = SimpleEntry
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent(), imageAvatars: ["Photo1", "Photo2", "Photo3", "Photo4", "Photo6", "Photo7", "Photo8", "Photo9"].shuffled())
    }
    
    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration, imageAvatars: ["Photo1", "Photo2", "Photo3", "Photo4", "Photo6", "Photo7", "Photo8", "Photo9"].shuffled ())
        completion(entry)
    }
    
    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []
        
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let imageAvatars = ["Photo1", "Photo2", "Photo3", "Photo4", "Photo6", "Photo7", "Photo8", "Photo9"].shuffled()
            let entry = SimpleEntry(date: entryDate, configuration: configuration, imageAvatars: imageAvatars)
            entries.append(entry)
        }
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
    let imageAvatars: [String]
}


struct WBWidget: Widget {
    let kind: String = "WBWidget"
    
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            WBWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Widget WBChat with contacts")
        .description("This widget shows user avatars, when clicked, they go to the contacts page.")
        .supportedFamilies([.systemMedium])
    }
}

struct WBWidget_Previews: PreviewProvider {
    static var previews: some View {
        WBWidgetEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent(), imageAvatars: ["Photo1", "Photo2", "Photo3", "Photo4", "Photo6", "Photo7", "Photo8", "Photo9"].shuffled()))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}

//
//  StringIntepolationView.swift
//  WBChatAppSUI
//
//  Created by Daria on 21.06.2024.
//

import SwiftUI

extension String.StringInterpolation {
    mutating func appendInterpolation(_ date: Date, locale: Locale, style: DateFormatter.Style) {
        let formatter = DateFormatter()
        formatter.locale = locale
        formatter.dateStyle = style
        let formatterDate = formatter.string(from: date)
        appendLiteral(formatterDate)
    }
}

struct StringIntepolationView: View {
    @State var selectedDate = Date()
    @State var selectedLocale = Locale.current
    
    var dateStyle = DateFormatter.Style.long
    let locales: [Locale] = [
        Locale(identifier: "en_US"),
        Locale(identifier: "es_ES"),
        Locale(identifier: "ru_RU"),
        Locale(identifier: "de_DE"),
        Locale(identifier: "zh_CN")
    ]
    let localeFlags = ["🇺🇸", "🇪🇸", "🇷🇺", "🇩🇪", "🇨🇳"]
    var body: some View {
        VStack {
            Text("Select a date and language to find out the dates for the nearest days to the selected one in the language you need")
                .font(.title2).bold()
                .padding(16)
                .multilineTextAlignment(.center)
            
            DatePicker("Select a date",selection: $selectedDate,displayedComponents: [.date])
                .padding()
            
            Picker("Choose a language", selection:$selectedLocale) {
                ForEach(0..<locales.count, id: \.self) { i in
                    Text(self.localeFlags[i]).tag(self.locales[i])
                }
            }
            .pickerStyle(.segmented)
            .padding()

            let dates = createDates(from: selectedDate)
            List {
                ForEach(dates, id: \.self) { dateText in
                    Text(dateText)
                        .font(dateText.contains("Today") ? .subheadline.bold() : .subheadline)
                }
            }
            .listStyle(.plain)
            .font(.subheadline)
        }
    }
    
    private func createDates(from date: Date) -> [String] {
        let calendar = Calendar.current
        let dayOffsets = [-2,-1,0,1,2]
        let dayNames = ["Day before yesterday", "Yesterday", "Today", "Tomorrow", "Day after tomorrow"]
        
        return dayOffsets.enumerated().map { index, offset in
            let newDate = calendar.date(byAdding: .day, value: offset, to: date)!
            return "\(dayNames[index]): \(newDate, locale: selectedLocale, style: dateStyle)"
        }
    }
}

struct StringIntepolationView_Previews: PreviewProvider {
    static var previews: some View {
        StringIntepolationView()
    }
}


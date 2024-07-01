//
//  CountriesScreen.swift
//  WBChatAppSUI
//
//  Created by Daria on 01.07.2024.
//

import SwiftUI

struct Flag: Identifiable {
    let id = UUID()
    var emoji: String = ""
    var name: String = ""
    
    static let oceania = [
        Flag(emoji: "🇦🇨", name: "Ascension Island"),
        Flag(emoji: "🇦🇶", name: "Antarctica"),
        Flag(emoji: "🇦🇸", name: "American Samoa"),
        Flag(emoji: "🇦🇺", name: "Australia"),
        Flag(emoji: "🇦🇽", name: "Åland Islands"),
        Flag(emoji: "🇧🇻", name: "Bouvet Island"),
        Flag(emoji: "🇨🇨", name: "Cocos (Keeling) Islands"),
        Flag(emoji: "🇨🇰", name: "Cook Islands"),
        Flag(emoji: "🇨🇵", name: "Clipperton Island"),
        Flag(emoji: "🇨🇽", name: "Christmas Island"),
        Flag(emoji: "🇩🇬", name: "Diego Garcia"),
        Flag(emoji: "🇫🇯", name: "Fiji"),
        Flag(emoji: "🇫🇲", name: "Micronesia"),
        Flag(emoji: "🇬🇱", name: "Greenland"),
        Flag(emoji: "🇬🇸", name: "South Georgia & South Sandwich Islands"),
        Flag(emoji: "🇬🇺", name: "Guam"),
        Flag(emoji: "🇭🇲", name: "Heard & McDonald Islands"),
        Flag(emoji: "🇮🇨", name: "Canary Islands"),
        Flag(emoji: "🇮🇴", name: "British Indian Ocean Territory"),
        Flag(emoji: "🇰🇮", name: "Kiribati"),
        Flag(emoji: "🇲🇭", name: "Marshall Islands"),
        Flag(emoji: "🇲🇵", name: "Northern Mariana Islands"),
        Flag(emoji: "🇳🇨", name: "New Caledonia"),
        Flag(emoji: "🇳🇫", name: "Norfolk Island"),
        Flag(emoji: "🇳🇷", name: "Nauru"),
        Flag(emoji: "🇳🇺", name: "Niue"),
        Flag(emoji: "🇳🇿", name: "New Zealand"),
        Flag(emoji: "🇵🇫", name: "French Polynesia"),
        Flag(emoji: "🇵🇬", name: "Papua New Guinea"),
        Flag(emoji: "🇵🇳", name: "Pitcairn Islands"),
        Flag(emoji: "🇵🇼", name: "Palau"),
        Flag(emoji: "🇷🇪", name: "Réunion"),
        Flag(emoji: "🇸🇧", name: "Solomon Islands"),
        Flag(emoji: "🇸🇭", name: "St. Helena"),
        Flag(emoji: "🇸🇯", name: "Svalbard & Jan Mayen"),
        Flag(emoji: "🇸🇹", name: "São Tomé & Príncipe"),
        Flag(emoji: "🇹🇦", name: "Tristan Da Cunha"),
        Flag(emoji: "🇹🇫", name: "French Southern Territories"),
        Flag(emoji: "🇹🇰", name: "Tokelau"),
        Flag(emoji: "🇹🇴", name: "Tonga"),
        Flag(emoji: "🇹🇻", name: "Tuvalu"),
        Flag(emoji: "🇺🇲", name: "U.S. Outlying Islands"),
        Flag(emoji: "🇻🇨", name: "St. Vincent & Grenadines"),
        Flag(emoji: "🇻🇺", name: "Vanuatu"),
        Flag(emoji: "🇼🇫", name: "Wallis & Futuna"),
        Flag(emoji: "🇼🇸", name: "Samoa"),
        Flag(emoji: "🇾🇹", name: "Mayotte")
    ]
}

struct CountriesScreen: View {
    @State var flags: [Flag] = Flag.oceania
    
    var body: some View {
        List {
            ForEach(flags) { flag in
                HStack {
                    Text(flag.emoji)
                    Text(flag.name)
                }
            }
            .onMove { flags.move(fromOffsets: $0, toOffset: $1) }
            .onDelete { flags.remove(atOffsets: $0) }
        }
    }
}

struct Countries_Previews: PreviewProvider {
    static var previews: some View {
        CountriesScreen()
    }
}

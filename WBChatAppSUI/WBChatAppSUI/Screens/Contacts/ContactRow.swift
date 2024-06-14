//
//  ContactRow.swift
//  WBChatAppSUI
//
//  Created by Daria on 10.06.2024.
//

import SwiftUI

struct ContactRow: View {
    var contact: Contact
    
    var body: some View {
        HStack(alignment: .center) {
            AvatarView(avatar: contact.avatar, name: contact.name, isOnline: contact.isOnline, hasHistory: contact.isSrorying)
                .padding(.trailing, 12)
            
            
            VStack(spacing: 2) {
                Text(contact.name)
                    .frame(width: 259,height: 24, alignment: .leading)
                
                Text(contact.isOnline ? "Online" : "Last seen \(timeMahager(since: contact.lastSeen ?? Date.now))")
                    .textStyle(with: .metadata1)
                    .foregroundColor(Resources.Colors.NeutralColor.disabled)
                    .frame(width: 259,height: 20, alignment: .leading)
                
            }
        }
        .contentShape(Rectangle())
        .padding(.leading, 4)
        .frame(width: 327, height: 68)
    }
    
    func timeMahager(since date: Date) -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.dateTimeStyle = .named
        return formatter.localizedString(for: date, relativeTo: Date())
    }
}

struct ContactRow_Previews: PreviewProvider {
    static var previews: some View {
        ContactRow(contact: Contact(name: "Анна Иванова", isSrorying: true, isOnline: true, lastSeen: Date.now, avatar: "Alina", phoneNumber: "+7 999 999-99-99"))
    }
}

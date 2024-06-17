//
//  ContactsScreen.swift
//  WBChatAppSUI
//
//  Created by Daria on 05.06.2024.
//

import SwiftUI

struct ContactsScreen: View {
    
    @State private var contacts: [Contact] = [
        Contact(name: "Анастасия Иванова", isSrorying: false, isOnline: false, lastSeen: Date(timeIntervalSinceNow: -86400), avatar: "Alina", phoneNumber: "+7 999 999-99-99"),
        Contact(name: "Петя", isSrorying: false, isOnline: true, lastSeen: nil, avatar: "Petya", phoneNumber: "+7 999 999-99-90"),
        Contact(name: "Маман", isSrorying: true, isOnline: false, lastSeen: Date(timeIntervalSinceNow: -10800), avatar: "Mama", phoneNumber: "+7 999 999-99-98"),
        Contact(name: "Арбуз Дыня", isSrorying: false, isOnline: true, lastSeen: nil, avatar: "Arbus", phoneNumber: "+7 999 999-99-96"),
        Contact(name: "Иван Иванов", isSrorying: false, isOnline: true, lastSeen: nil, avatar: nil, phoneNumber: "+7 999 999-99-94"),
        Contact(name: "Лиса Алиса", isSrorying: true, isOnline: false, lastSeen: Date(timeIntervalSinceNow: -1800), avatar: nil, phoneNumber: "+7 999 999-99-93")
    ]
    
    @State private var searchText: String = ""
    @State private var selectedContact: Contact? = nil
    @State private var navigateToProfile: Bool = false
    
    var filteredContacts: [Contact] {
        if searchText.isEmpty {
            return contacts
        } else {
            return contacts.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Resources.Colors.NeutralColor.whiteForBG
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    SearchBarView(searchText: $searchText)
                        .padding(.top, 16)
                    List(filteredContacts) { contact in
                        ContactRow(contact: contact)
                            .onTapGesture {
                                selectedContact = contact
                                navigateToProfile.toggle()
                            }
                            .listRowBackground(Resources.Colors.NeutralColor.whiteForBG)
                    }
                }
                .listStyle(.plain)
            }
            .foregroundColor(Resources.Colors.NeutralColor.active)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Контакты")
                        .textStyle(with: .subheading1)
                        .foregroundColor(Resources.Colors.NeutralColor.active)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        //
                    } label: {
                        Image(systemName: "plus")
                            .tint(Resources.Colors.NeutralColor.active)
                    }
                }
            }
            .navigationDestination(isPresented: $navigateToProfile) {
                if let contact = selectedContact {
                    ProfileAccountView(contact: contact)
                }
            }
        }
    }
}

struct ContactsScreen_Previews: PreviewProvider {
    static var previews: some View {
        ContactsScreen()
    }
}

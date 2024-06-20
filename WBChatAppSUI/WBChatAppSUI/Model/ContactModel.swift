//
//  ContactModel.swift
//  WBChatAppSUI
//
//  Created by Daria on 10.06.2024.
//

import Foundation

struct Contact {
    let id = UUID()
    let name: String
    let isSrorying: Bool
    let isOnline: Bool
    let lastSeen: Date?
    let avatar: String?
    let phoneNumber: String
}

extension Contact: Hashable, Identifiable {
    
}

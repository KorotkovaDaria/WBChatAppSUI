//
//  ProfileAccountView.swift
//  WBChatAppSUI
//
//  Created by Daria on 10.06.2024.
//

import SwiftUI

struct ProfileAccountView: View {
    @Environment(\.dismiss) var dismiss
    var contact: Contact
    var body: some View {
        NavigationStack {
            ZStack {
                    Resources.Colors.NeutralColor.whiteForBG
                        .ignoresSafeArea()
                    VStack {
                        Spacer()
                        ProfileImageView(avatar: contact.avatar)
                            .padding(20)
                        VStack {
                            Text(contact.name)
                                .textStyle(with: .neading2)
                                .foregroundColor(Resources.Colors.NeutralColor.active)
                            Text(contact.phoneNumber)
                                .font(.system(size: 16, weight: .regular))
                                .foregroundColor(Resources.Colors.NeutralColor.disabled)
                        }
                        
                        HStack(spacing: 12) {
                            ButtonMedia(label: "twitter")
                            ButtonMedia(label: "instagram")
                            ButtonMedia(label: "LinkedIn")
                            ButtonMedia(label: "facebook")
                        }
                        .padding(.top, 30)
                        Spacer()
                        Spacer()
                        Spacer()
                    }
                }
            
            .navigationBarBackButtonHidden()
            .foregroundColor(Resources.Colors.NeutralColor.active)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack(spacing: 8) {
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "chevron.left")
                                .tint(Resources.Colors.NeutralColor.active)
                        }
                        
                        Text("Профиль")
                            .textStyle(with: .subheading1)
                        .foregroundColor(Resources.Colors.NeutralColor.active)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        //
                    } label: {
                        Image(systemName: "pencil")
                            .tint(Resources.Colors.NeutralColor.active)
                    }
                }
            }
        }
    }
}

struct ProfileAccountView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileAccountView(contact: Contact(name: "Анна Иванова", isSrorying: true, isOnline: true, lastSeen: Date.now, avatar: nil, phoneNumber: "+7 999 999-99-99"))
    }
}

struct ButtonMedia: View {
    let label: String
    var body: some View {
        Button {
            //do someting
        } label: {
            Image(label)
        }
        .buttonStyle(StatefulButtonStyle(size: CGSize(width: 72, height: 40), state: .borderNormal))
    }
}

struct ProfileImageView: View {
    let avatar: String?
    
    var body: some View {
        Group {
            if let avatar = avatar {
                Image(avatar)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
            } else {
                Image("Change Avatar")
                    .resizable()
                    .frame(width: 200, height: 200)
            }
        }
    }
}

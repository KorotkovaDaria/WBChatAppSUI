//
//  SearchBarView.swift
//  WBChatAppSUI
//
//  Created by Daria on 10.06.2024.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String
    @State var isSearching = false
    
    var body: some View {
        HStack {
            if !searchText.isEmpty {
                Button(action: {
                    self.searchText = ""
                }) {
                    Image(systemName: "multiply.circle.fill")
                        .padding(.leading,8)
                        .foregroundColor(Resources.Colors.NeutralColor.disabled)
                        .opacity(0.5)
                }
            } else {
                Image(systemName: "magnifyingglass")
                    .padding(.leading,8)
                    .foregroundColor(Resources.Colors.NeutralColor.disabled)
                    .opacity(0.5)
            }
            TextField("Search", text: $searchText)
                .textStyle(with: .bodyText1)
                .frame(width: 327, height: 36)
                .foregroundColor(Resources.Colors.NeutralColor.disabled)
            
        }
        .background(Resources.Colors.NeutralColor.secondaryBG)
        .cornerRadius(4)
        .padding(.horizontal)
        .onTapGesture {
            isSearching = true
        }
    }
}

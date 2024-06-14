//
//  SearchBarView.swift
//  WBChatAppSUI
//
//  Created by Daria on 10.06.2024.
//

import SwiftUI

struct SearchBarView: View {
    @State var searchText = ""
    @State var isSearching = false
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .padding(.leading,8)
                .foregroundColor(Resources.Colors.NeutralColor.disabled)
                .opacity(0.5)
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

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView()
    }
}

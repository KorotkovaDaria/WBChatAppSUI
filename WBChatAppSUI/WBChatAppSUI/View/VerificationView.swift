//
//  VerificationView.swift
//  WBChatAppSUI
//
//  Created by Daria on 05.06.2024.
//

import SwiftUI

struct VerificationView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            Spacer()
            Text("Введите номер телефона")
                .font(.system(size: 24))
                .bold()
                .foregroundColor(Resources.Colors.NeutralColor.active)
            Spacer()
            Spacer()
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            dismiss()
                        } label: {
                            Image("variant=chevron_left")
                                .renderingMode(.template)
                                .foregroundColor(Resources.Colors.NeutralColor.active)
                            
                        }
                    }
                }
        }
    }
}

struct VerificationView_Previews: PreviewProvider {
    static var previews: some View {
        VerificationView()
    }
}

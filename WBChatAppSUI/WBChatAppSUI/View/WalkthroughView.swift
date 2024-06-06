//
//  WalkthroughView.swift
//  WBChatAppSUI
//
//  Created by Daria on 05.06.2024.
//

import SwiftUI

struct WalkthroughView: View {
    
    @State var isPresented = false
    
    var body: some View {
        VStack {
            Spacer()
            Image("Illustration")
                .resizable()
                .frame(width: 262, height: 271)
                .padding(42)
            Text("Общайтесь с друзьями и близкими легко")
                .textStyle(with: .neading2)
                .foregroundColor(Resources.Colors.NeutralColor.active)
            Spacer()
            Spacer()
            
            
            Button("Пользовательское соглашение") {
                //do something
            }
            .textStyle(with: .bodyText1)
            .foregroundColor(Resources.Colors.NeutralColor.active)
            .padding(18)
            
            Button("Начать общаться") {
                isPresented.toggle()
            }
            .buttonStyle(StatefulButtonStyle(size: CGSize(width: 327, height: 52), state: .fillNormal))
            
            Spacer()
            
            .sheet(isPresented: $isPresented) {
                    VerificationView()
                }
        }
        .multilineTextAlignment(.center)
    }
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        WalkthroughView()
    }
}

//
//  StatefulButtonStyle.swift
//  WBChatAppSUI
//
//  Created by Daria on 05.06.2024.
//

import SwiftUI

enum StatesButton {
    case normal
    case pressed
    case disabled
    
    case fillNormal
    case fillPressed
    case fillDisabled
    
    case borderNormal
    case borderPressed
    case borderDisabled
}

struct StatefulButtonStyle: ButtonStyle {
    var size: CGSize
    var state: StatesButton
    
    func makeBody(configuration: Configuration) -> some View {
        var backgroundColor: Color
        var foregroundColor: Color
        var borderColor: Color
        
        switch state {
        case .normal:
            backgroundColor = Color.clear
            foregroundColor = configuration.isPressed ? Resources.Colors.BrandColor.bcDarkButtonOnPressed : Resources.Colors.BrandColor.bcDefaultButton
            borderColor = Color.clear
        case .pressed:
            backgroundColor = Color.clear
            foregroundColor = Resources.Colors.BrandColor.bcDarkButtonOnPressed
            borderColor = Color.clear
        case .disabled:
            backgroundColor = Color.clear
            foregroundColor = Resources.Colors.BrandColor.bcDefaultButton
            borderColor = Color.clear
            
        case .fillNormal:
            backgroundColor = configuration.isPressed ? Resources.Colors.BrandColor.bcDarkButtonOnPressed : Resources.Colors.BrandColor.bcDefaultButton
            foregroundColor = Resources.Colors.NeutralColor.whiteForBG
            borderColor = Color.clear
        case .fillPressed:
            backgroundColor = Resources.Colors.BrandColor.bcDarkButtonOnPressed
            foregroundColor = Resources.Colors.NeutralColor.whiteForBG
            borderColor = Color.clear
        case .fillDisabled:
            backgroundColor = Resources.Colors.BrandColor.bcDefaultButton
            foregroundColor = Resources.Colors.NeutralColor.whiteForBG
            borderColor = Color.clear
            
        case .borderNormal:
            backgroundColor = Color.clear
            foregroundColor = configuration.isPressed ? Resources.Colors.BrandColor.bcDarkButtonOnPressed : Resources.Colors.BrandColor.bcDefaultButton
            borderColor = configuration.isPressed ? Resources.Colors.BrandColor.bcDarkButtonOnPressed : Resources.Colors.BrandColor.bcDefaultButton
        case .borderPressed:
            backgroundColor = Color.clear
            foregroundColor = Resources.Colors.BrandColor.bcDarkButtonOnPressed
            borderColor = Resources.Colors.BrandColor.bcDarkButtonOnPressed
        case .borderDisabled:
            backgroundColor = Color.clear
            foregroundColor = Resources.Colors.BrandColor.bcDefaultButton
            borderColor = Resources.Colors.BrandColor.bcDefaultButton
        }
        
        return configuration.label
            .frame(width: size.width, height: size.height)
            .background(backgroundColor)
            .foregroundColor(foregroundColor)
            .overlay(
                RoundedRectangle(cornerRadius: 30)
                    .stroke(borderColor, lineWidth: 2)
            )
            .cornerRadius(30)
            .textStyle(with: .subheading2)
            .opacity(state == .disabled || state == .fillDisabled || state == .borderDisabled ? 0.5 : 1.0)
    }
    
    
}

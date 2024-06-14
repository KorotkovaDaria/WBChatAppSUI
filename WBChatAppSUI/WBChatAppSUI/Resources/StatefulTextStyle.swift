//
//  StatefulTextStyle.swift
//  WBChatAppSUI
//
//  Created by Daria on 05.06.2024.
//

import SwiftUI

enum Typography {
    case neading1
    case neading2
    
    case subheading1
    case subheading2
    
    case bodyText1
    case bodyText2
    
    case metadata1
    case metadata2
    case metadata3
}

struct StatefulTextStyle: ViewModifier {
    var typography: Typography
    
    func body(content: Content) -> some View {
        switch typography {
        case .neading1:
            return content
                .font(.system(size: 32, weight: .bold))
        case .neading2:
            return content
                .font(.system(size: 24, weight: .bold))
        
        case .subheading1:
            return content
                .font(.system(size: 18, weight: .semibold))
        case .subheading2:
            return content
                .font(.system(size: 16, weight: .semibold))
        
        case .bodyText1:
            return content
                .font(.system(size: 14, weight: .semibold))
        case .bodyText2:
            return content
                .font(.system(size: 14, weight: .regular))
        
        case .metadata1:
            return content
                .font(.system(size: 12, weight: .regular))
        case .metadata2:
            return content
                .font(.system(size: 10, weight: .regular))
        case .metadata3:
            return content
                .font(.system(size: 10, weight: .semibold))
        }
    }
}

extension View {
    func textStyle(with typography: Typography ) -> some View {
        modifier(StatefulTextStyle(typography: typography))
    }
}

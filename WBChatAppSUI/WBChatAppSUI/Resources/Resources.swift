//
//  Resources.swift
//  WBChatAppSUI
//
//  Created by Daria on 05.06.2024.
//

import SwiftUI

enum Resources {
    enum Colors {
        enum BrandColor {
            static let bc_bg                  = Color("BC_BG")
            static let bcDarkButtonOnPressed  = Color("BC_DarkButtonOnPressed")
            static let bcDarkMode             = Color("BC_DarkMode")
            static let bcDefaultButton        = Color("BC_DefaultButton")
            static let bcLightVariant         = Color("BC_LightVariant")
        }
        
        enum NeutralColor {
            static let active            = Color("Neutral_Active")
            static let bodyText          = Color("Neutral_BodyText")
            static let darkMode          = Color("Neutral_DarkMode")
            static let disabled          = Color("Neutral_Disabled")
            static let lineForDivider    = Color("Neutral_LineForDivider")
            static let secondaryBG       = Color("Neutral_SecondaryBG")
            static let weakSecondaryText = Color("Neutral_WeakSecondaryText")
            static let whiteForBG        = Color("Neutral_WhiteForBG")
        }
        
        enum AccentColor {
            static let danger  = Color("Accent_Danger")
            static let safe    = Color("Accent_Safe")
            static let success = Color("Accent_Success")
            static let warning = Color("Accent_Warning")
        }
        
        enum GradientColor {
            static let gradient1_Dark  = Color("Gradient1_Dark")
            static let gradient1_Light = Color("Gradient1_Light")
            static let gradient2_Dark  = Color("Gradient2_Dark")
            static let gradient2_Light = Color("Gradient2_Light")
        }
        

    }
    
    enum ImageTitle {
        enum DefaultImage {
            static let Illustration  = "Illustration"
        }
        enum SystemImage {
            static let tabBarPerson = "person.2"
            static let tabBarChats  = "message"
            static let tabBarMore   = "ellipsis"
        }
    }
}

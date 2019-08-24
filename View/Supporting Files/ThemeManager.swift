//
//  ThemeManager.swift
//  Domain
//
//  Created by Erika Segatto on 01/03/18.
//  Copyright © 2018 evologica. All rights reserved.
//

import Foundation
import UIKit
import MaterialComponents

protocol AppTheme {
    var themeNumber: Int { get }
    var primaryColor: UIColor { get }
    var primaryColorDarker: UIColor { get }
    
    var textColor: UIColor { get }
    var tabTextFont: UIFont { get }
    
    var fieldNeutralColor: UIColor { get }
    var fieldValidColor: UIColor { get }
    var fieldInvalidColor: UIColor { get }
    
    var textFieldType: MDCTextInputController.Type { get }
}

fileprivate struct DefaultTheme: AppTheme {
    
    var themeNumber: Int = 1
    
    var primaryColor       = UIColor(red: 218 / 255.0, green: 1 / 255.0, blue: 1 / 255.0, alpha: 1)
    var primaryColorDarker = UIColor(red: 200 / 255.0, green: 4 / 255.0, blue: 4 / 255.0, alpha: 1)
    var textColor          = UIColor.white
    var tabTextFont        = UIFont(name: "DINPro-Bold", size: 12) ?? UIFont.boldSystemFont(ofSize: 12)
    
    var fieldNeutralColor  = UIColor(red: 172 / 255.0, green: 172 / 255.0, blue: 172 / 255.0, alpha: 1)
    var fieldValidColor    = UIColor(red: 101 / 255.0, green: 190 / 255.0, blue: 48 / 255.0, alpha: 1)
    var fieldInvalidColor  = UIColor(red: 255 / 255.0, green: 31 / 255.0, blue: 31 / 255.0, alpha: 1)
    
    var textFieldType: MDCTextInputController.Type = MDCTextInputControllerUnderline.self
}


// This will let you use a theme in the app.
class ThemeManager {
    private static var selectedTheme: AppTheme = DefaultTheme()
    
    // ThemeManager
    static func current() -> AppTheme {
        return selectedTheme
    }
    
    static func applyTheme(theme: AppTheme) {
        // First persist the selected theme using NSUserDefaults.
        selectedTheme = theme
        
        let typographyScheme = MDCTypographyScheme()
        typographyScheme.button = theme.tabTextFont
        typographyScheme.caption = theme.tabTextFont
        typographyScheme.body1 = theme.tabTextFont
        typographyScheme.body2 = theme.tabTextFont
        typographyScheme.headline1 = theme.tabTextFont
        typographyScheme.headline2 = theme.tabTextFont
        typographyScheme.headline3 = theme.tabTextFont
        typographyScheme.headline4 = theme.tabTextFont
        typographyScheme.headline5 = theme.tabTextFont
        typographyScheme.headline6 = theme.tabTextFont
        typographyScheme.overline = theme.tabTextFont
        typographyScheme.subtitle1 = theme.tabTextFont
        typographyScheme.subtitle1 = theme.tabTextFont
        
        
        // MARK: Field
        let fieldColorScheme = MDCSemanticColorScheme()
        fieldColorScheme.primaryColor = theme.fieldNeutralColor // active color
        fieldColorScheme.onSurfaceColor = theme.fieldNeutralColor // inactive color
        fieldColorScheme.errorColor = theme.fieldInvalidColor
        MDCTextFieldColorThemer.apply(fieldColorScheme, toAllControllersOfClass: MDCTextInputControllerUnderline.self)
        MDCTextFieldTypographyThemer.applyTypographyScheme(typographyScheme, to: MDCTextField.appearance())
        
        // MARK: Button
        let buttonColorScheme = MDCSemanticColorScheme()
        buttonColorScheme.primaryColor = theme.primaryColor
        buttonColorScheme.onPrimaryColor = theme.textColor
        buttonColorScheme.surfaceColor = theme.primaryColor
        buttonColorScheme.onBackgroundColor = theme.textColor
        
        MDCButtonColorThemer.applySemanticColorScheme(buttonColorScheme, to: MDCButton.appearance())
        MDCButtonTypographyThemer.applyTypographyScheme(typographyScheme, to: MDCButton.appearance())
        
        UIButton.appearance().tintColor = theme.primaryColor
        
        // MARK: TabBar
        MDCTabBar.appearance().selectedItemTintColor = theme.textColor
        MDCTabBar.appearance().unselectedItemTintColor = theme.textColor
        MDCTabBar.appearance().selectedItemTitleFont = theme.tabTextFont
        MDCTabBar.appearance().unselectedItemTitleFont = theme.tabTextFont
        MDCTabBar.appearance().inkColor = .clear
        MDCTabBar.appearance().barTintColor = theme.primaryColorDarker // background
        MDCTabBar.appearance().titleTextTransform = .none
        MDCTabBar.appearance().tintColor = UIColor.cyan
        
    }
    
    static func applyNavBarStyle(_ navBar: UINavigationBar?){
        guard let navBar = navBar else { return }
        navBar.setBackgroundImage(UIImage(), for: .default)
        navBar.shadowImage = UIImage()
        navBar.isTranslucent = true
    }
}

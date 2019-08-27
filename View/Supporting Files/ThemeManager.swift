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
    
    var tabTextColor: UIColor { get }
    var tabTextFont: UIFont { get }
    
    var fieldNeutralColor: UIColor { get }
    var fieldValidColor: UIColor { get }
    var fieldInvalidColor: UIColor { get }
    
    var fundRisk1Color: UIColor { get }
    var fundRisk2Color: UIColor { get }
    var fundRisk3Color: UIColor { get }
    var fundRisk4Color: UIColor { get }
    var fundRisk5Color: UIColor { get }
    
    var fundPrimaryTextColor: UIColor { get }
    var fundSecondaryTextColor: UIColor { get }
    var fundPrimaryFont: UIFont { get }
    var fundInfoFont: UIFont { get }
    
    var textFieldType: MDCTextInputController.Type { get }
}

fileprivate struct DefaultTheme: AppTheme {
    
    var themeNumber: Int = 1
    
    var primaryColor       = UIColor(red: 218 / 255.0, green: 1 / 255.0, blue: 1 / 255.0, alpha: 1)
    var primaryColorDarker = UIColor(red: 200 / 255.0, green: 4 / 255.0, blue: 4 / 255.0, alpha: 1)
    var tabTextColor       = UIColor.white
    var tabTextFont        = UIFont(name: "DINPro-Bold", size: 12) ?? UIFont.boldSystemFont(ofSize: 12)
    
    var fieldNeutralColor  = UIColor(red: 172 / 255.0, green: 172 / 255.0, blue: 172 / 255.0, alpha: 1)
    var fieldValidColor    = UIColor(red: 101 / 255.0, green: 190 / 255.0, blue: 48 / 255.0, alpha: 1)
    var fieldInvalidColor  = UIColor(red: 255 / 255.0, green: 31 / 255.0, blue: 31 / 255.0, alpha: 1)
    
    var fundRisk1Color  = UIColor(red: 116 / 255.0, green: 218 / 255.0, blue: 97 / 255.0, alpha: 1)
    var fundRisk2Color  = UIColor(red: 74 / 255.0, green: 193 / 255.0, blue: 108 / 255.0, alpha: 1)
    var fundRisk3Color  = UIColor(red: 255 / 255.0, green: 192 / 255.0, blue: 17 / 255.0, alpha: 1)
    var fundRisk4Color  = UIColor(red: 255 / 255.0, green: 116 / 255.0, blue: 44 / 255.0, alpha: 1)
    var fundRisk5Color  = UIColor(red: 254 / 255.0, green: 54 / 255.0, blue: 52 / 255.0, alpha: 1)
    
    var fundPrimaryTextColor = UIColor(red: 100 / 255.0, green: 100 / 255.0, blue: 100 / 255.0, alpha: 1)
    var fundSecondaryTextColor = UIColor.lightGray
    var fundPrimaryFont = UIFont(name: "DINPro-Medium", size: 16) ?? UIFont.boldSystemFont(ofSize: 16)
    var fundInfoFont = UIFont(name: "DINMittelschriftStd", size: 15) ?? UIFont.systemFont(ofSize: 15)
    
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
        typographyScheme.button = theme.fundInfoFont
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
        buttonColorScheme.onPrimaryColor = theme.tabTextColor
        buttonColorScheme.surfaceColor = theme.primaryColor
        buttonColorScheme.onBackgroundColor = theme.tabTextColor
        
        MDCButtonColorThemer.applySemanticColorScheme(buttonColorScheme, to: MDCButton.appearance())
        MDCButtonTypographyThemer.applyTypographyScheme(typographyScheme, to: MDCButton.appearance())
        
        UIButton.appearance().tintColor = theme.primaryColor
        
        // MARK: TabBar
        MDCTabBar.appearance().selectedItemTintColor = theme.tabTextColor
        MDCTabBar.appearance().unselectedItemTintColor = theme.tabTextColor
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
        navBar.backgroundColor = .white
    }
}

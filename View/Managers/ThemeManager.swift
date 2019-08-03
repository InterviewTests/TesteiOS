//
//  ThemeManager.swift
//  Domain
//
//  Created by Erika Segatto on 01/03/18.
//  Copyright © 2018 evologica. All rights reserved.
//

import Foundation
import UIKit
//import MaterialComponents

protocol AppTheme {
    var themeNumber: Int { get }
    var primaryColor: UIColor { get }
    var secondaryColor: UIColor { get }
    var titleTextColor: UIColor { get }
    var subtitleTextColor: UIColor { get }
    
    var labelSubtitleFont: UIFont { get }
    var labelSubtitleColor: UIColor { get }
    var labelTitleFont: UIFont { get }
    var labelTitleColor: UIColor { get }
    
//    var textFieldType: MDCTextInputController.Type { get }
}

fileprivate struct DefaultTheme: AppTheme {
    var themeNumber: Int = 1
    
    var primaryColor      = UIColor(red: 0, green: 0.67, blue: 0.55, alpha: 1)
    var secondaryColor    = UIColor(red: 1, green: 0.33, blue: 0.45, alpha: 1)
    var titleTextColor    = UIColor.white
    var subtitleTextColor = UIColor.gray
    
//    var textFieldType: MDCTextInputController.Type = MDCTextInputControllerUnderline.self
    
    var labelTitleFont     = UIFont.systemFont(ofSize: 15)// MDCTypography.body1Font()
    var labelTitleColor    = UIColor.black
    var labelSubtitleFont  = UIFont.systemFont(ofSize: 13)// MDCTypography.captionFont()
    var labelSubtitleColor = UIColor.gray
}


// This will let you use a theme in the app.
class ThemeManager {
    private static var selectedTheme: AppTheme = DefaultTheme()
    
    // ThemeManager
    static func currentTheme() -> AppTheme {
        return selectedTheme
    }
    
    static func applyTheme(theme: AppTheme) {
        // First persist the selected theme using NSUserDefaults.
        selectedTheme = theme
        
//        let colorScheme = MDCBasicColorScheme(primaryColor: theme.primaryColor,
//                                              primaryLightColor: theme.titleTextColor,
//                                              primaryDarkColor: theme.titleTextColor,
//                                              secondaryColor: theme.secondaryColor,
//                                              secondaryLightColor: theme.labelSubtitleColor,
//                                              secondaryDarkColor: theme.labelTitleColor)
        
//        UserDefaults.standard.setValue(theme.rawValue, forKey: SelectedThemeKey)
//        UserDefaults.standard.synchronize()
        
        // You get your current (selected) theme and apply the main color to the tintColor property of your application’s window.
//        UIApplication.shared.delegate?.window??.tintColor = theme.titleTextColor
        
//        UINavigationBar.appearance().barStyle = theme.barStyle
//        UINavigationBar.appearance().setBackgroundImage(theme.navigationBackgroundImage, for: .default)
//        UINavigationBar.appearance().backIndicatorImage = UIImage(named: "backArrow")
//        UINavigationBar.appearance().backIndicatorTransitionMaskImage = UIImage(named: "backArrowMaskFixed")
        
//        UITabBar.appearance().barStyle = theme.barStyle
//        UITabBar.appearance().backgroundImage = theme.tabBarBackgroundImage
        
//        let tabIndicator = UIImage(named: "tabBarSelectionIndicator")?.withRenderingMode(.alwaysTemplate)
//        let tabResizableIndicator = tabIndicator?.resizableImage(withCapInsets: UIEdgeInsets(top: 0, left: 2.0, bottom: 0, right: 2.0))
//        UITabBar.appearance().selectionIndicatorImage = tabResizableIndicator
//
//        let controlBackground = UIImage(named: "controlBackground")?.withRenderingMode(.alwaysTemplate)
//            .resizableImage(withCapInsets: UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3))
//        let controlSelectedBackground = UIImage(named: "controlSelectedBackground")?
//            .withRenderingMode(.alwaysTemplate)
//            .resizableImage(withCapInsets: UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3))
        
        UINavigationBar.appearance().backgroundColor = theme.primaryColor
        UINavigationBar.appearance().tintColor = theme.titleTextColor  // NavBar Items Color
        UINavigationBar.appearance().barTintColor = theme.primaryColor // NavBar Color
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor: theme.titleTextColor] // NavBar Title Color
//                                                            NSAttributedStringKey.font: MDCTypography.subheadFont()]
//        MDCNavigationBar.appearance().tintColor = theme.titleTextColor
        UICollectionView.appearance().backgroundColor = theme.titleTextColor
        
//        UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedStringKey.font: MDCTypography.buttonFont()], for: .normal)
        UITabBar.appearance().tintColor = theme.primaryColor
        
//        MDCFlexibleHeaderColorThemer.apply(colorScheme, to: MDCFlexibleHeaderView.appearance())
//        MDCButtonColorThemer.apply(colorScheme, to: MDCButton.appearance())
//        MDCButtonBarColorThemer.apply(colorScheme, to: MDCButtonBar.appearance())
//        MDCTextFieldColorThemer.apply(colorScheme, toAllControllersOfClass: MDCTextInputControllerOutlined.self)
//        MDCTextFieldColorThemer.apply(colorScheme, toAllControllersOfClass: MDCTextInputControllerUnderline.self)
//        MDCTextFieldColorThemer.apply(colorScheme, toAllControllersOfClass: MDCTextInputControllerFilled.self)
//        MDCTextFieldColorThemer.apply(colorScheme, toAllControllersOfClass: MDCTextInputControllerFullWidth.self)
//        MDCNavigationBarColorThemer.apply(colorScheme, to: MDCNavigationBar.appearance())
//        MDCProgressViewColorThemer.apply(colorScheme, to: MDCProgressView.appearance())
//        MDCSliderColorThemer.apply(colorScheme, to: MDCSlider.appearance())
        
//        UISegmentedControl.appearance().setBackgroundImage(controlBackground, for: .normal, barMetrics: .default)
//        UISegmentedControl.appearance().setBackgroundImage(controlSelectedBackground, for: .selected, barMetrics: .default)
        
//        UIStepper.appearance().setBackgroundImage(controlBackground, for: .normal)
//        UIStepper.appearance().setBackgroundImage(controlBackground, for: .disabled)
//        UIStepper.appearance().setBackgroundImage(controlBackground, for: .highlighted)
//        UIStepper.appearance().setDecrementImage(UIImage(named: "fewerPaws"), for: .normal)
//        UIStepper.appearance().setIncrementImage(UIImage(named: "morePaws"), for: .normal)
        
//        UISlider.appearance().setThumbImage(UIImage(named: "sliderThumb"), for: .normal)
//        UISlider.appearance().setMaximumTrackImage(UIImage(named: "maximumTrack")?
//            .resizableImage(withCapInsets: UIEdgeInsets(top: 0, left: 0.0, bottom: 0, right: 6.0)), for: .normal)
//        UISlider.appearance().setMinimumTrackImage(UIImage(named: "minimumTrack")?
//            .withRenderingMode(.alwaysTemplate)
//            .resizableImage(withCapInsets: UIEdgeInsets(top: 0, left: 6.0, bottom: 0, right: 0)), for: .normal)
        
//        UISwitch.appearance().onTintColor = theme.mainColor.withAlphaComponent(0.3)
//        UISwitch.appearance().thumbTintColor = theme.mainColor
    }
}

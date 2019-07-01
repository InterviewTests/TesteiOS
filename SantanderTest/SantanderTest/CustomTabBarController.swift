//
//  CustomTabBarController.swift
//  SantanderTest
//
//  Created by Filipe Oliveira on 27/06/19.
//  Copyright © 2019 Filipe Oliveira. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        tabBarAppearance()

        tabItemAppearance()
    }
    
    private func tabBarAppearance()
    {
        // self.tabBar também server
        let appearance = UITabBar.appearance(whenContainedInInstancesOf: [CustomTabBarController.self])
        
        // Remove linha da TabBar
        appearance.shadowImage = .init()
        appearance.backgroundImage = .init()
        
        // Sobrepoe propriedade BarTintColor
        appearance.backgroundColor = #colorLiteral(red: 1, green: 0.07238733253, blue: 0, alpha: 1)
        
        appearance.itemPositioning = .fill
        appearance.itemSpacing = 0
        
        // Calculo para criar imagem do tamanho BarItem

        var tabBarItemSize: CGSize = .init(width: self.tabBar.frame.width / CGFloat(self.tabBar.items?.count ?? 1), height: self.tabBar.frame.height + 10.0)
        
        // Correção para layout com SafeArea
        if #available(iOS 11.0, *)
        {
            tabBarItemSize.height += UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0
        }
        
        // Efeito de selecao BarItem
        appearance.selectionIndicatorImage = UIImage.imageWith(color: #colorLiteral(red: 0.7934507728, green: 0, blue: 0, alpha: 1), size: tabBarItemSize)
    }
    
    private func tabItemAppearance()
    {
        let appearance = UITabBarItem.appearance(whenContainedInInstancesOf: [CustomTabBarController.self])
        
        let attributes = [NSAttributedString.Key.font: UIFont(name: "DINPro-Medium", size: UIFont.systemFontSize) ?? UIFont.systemFont(ofSize: 40), NSAttributedString.Key.foregroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)] as [NSAttributedString.Key : Any]
        
        appearance.setTitleTextAttributes(attributes, for:.normal)
        appearance.setTitleTextAttributes(attributes, for:.selected)
        appearance.titlePositionAdjustment = .init(horizontal: 0, vertical: -16)
    }
}

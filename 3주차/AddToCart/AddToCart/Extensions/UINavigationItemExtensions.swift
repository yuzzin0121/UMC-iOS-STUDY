//
//  UINavigationItemExtensions.swift
//  AddToCart
//
//  Created by 조유진 on 2023/10/03.
//

import UIKit

extension UINavigationItem {
    func makeSFSymbolButton(_ target: Any?, action: Selector, iconName: String) -> UIBarButtonItem {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: iconName), for: .normal)
        button.addTarget(target, action: action, for: .touchUpInside)
        button.tintColor = .black
            
        let barButtonItem = UIBarButtonItem(customView: button)
        barButtonItem.customView?.translatesAutoresizingMaskIntoConstraints = false
        barButtonItem.customView?.heightAnchor.constraint(equalToConstant: 24).isActive = true
        barButtonItem.customView?.widthAnchor.constraint(equalToConstant: 24).isActive = true
            
        return barButtonItem
    }
}

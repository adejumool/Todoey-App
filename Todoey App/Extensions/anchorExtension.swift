//
//  anchorExtension.swift
//  Todoey App
//
//  Created by Tobi Adejumo on 12/27/19.
//  Copyright © 2019 Tobi Adejumo. All rights reserved.
//

import UIKit


extension UIView{
    func anchor(top:NSLayoutYAxisAnchor?,leading:NSLayoutXAxisAnchor?,bottom: NSLayoutYAxisAnchor?,trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, centerY:NSLayoutYAxisAnchor?, centerX:NSLayoutXAxisAnchor?){
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top{
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true

        }
        if let leading = leading{
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true

        }
        if let bottom=bottom{
            bottomAnchor.constraint(equalTo: bottom, constant: padding.bottom).isActive = true

        }
        if let trailing = trailing{
            trailingAnchor.constraint(equalTo: trailing, constant: padding.right).isActive = true
        }
        if let centerY = centerY{
            centerYAnchor.constraint(equalTo: centerY).isActive = true
        }
        if let centerX = centerX{
            centerXAnchor.constraint(equalTo: centerX).isActive = true
        }
        
    }
}

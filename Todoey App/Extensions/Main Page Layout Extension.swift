//
//  Main Page Layout Extension.swift
//  Todoey App
//
//  Created by Tobi Adejumo on 12/29/19.
//  Copyright © 2019 Tobi Adejumo. All rights reserved.
//

import UIKit

extension ViewController{
    
    
    func configureFooter(footer: UIView, footerElements: NewItemPopUp){
        footer.addSubview(footerElements)
        footerElements.frame = footer.bounds
    }
    func configureViews(){
        header.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 0, left: 0, bottom: -10, right: 0), centerY: nil, centerX: nil)
        body.anchor(top: header.bottomAnchor, leading: view.leadingAnchor, bottom: footer.topAnchor, trailing: view.trailingAnchor, centerY: nil, centerX: nil)
        footer.anchor(top: body.bottomAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor, centerY: nil, centerX: nil)

    }
}

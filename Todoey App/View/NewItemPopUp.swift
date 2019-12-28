//
//  NewItemPopUp.swift
//  Todoey App
//
//  Created by Tobi Adejumo on 12/27/19.
//  Copyright © 2019 Tobi Adejumo. All rights reserved.
//

import UIKit

class NewItemPopUp: UIView {

    let addButton: UIButton = {
        
        
        return UIButton()
    }()
    let buttonText: UILabel = {
        
        return UILabel()
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        [addButton,buttonText].forEach{addSubview($0)}
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

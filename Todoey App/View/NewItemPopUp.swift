//
//  NewItemPopUp.swift
//  Todoey App
//
//  Created by Tobi Adejumo on 12/27/19.
//  Copyright © 2019 Tobi Adejumo. All rights reserved.
//

import UIKit

class NewItemPopUp: UIButton {

    let addImage: UIImageView = {
        let view = UIImageView()
        
        view.heightAnchor.constraint(equalToConstant: 35).isActive = true
        view.widthAnchor.constraint(equalToConstant: 35).isActive = true
        view.image = UIImage(named:"addSign")
        return view
    }()
    let buttonText: UITextField = {
        let view = UITextField()
        
        view.adjustsFontSizeToFitWidth = true
        view.placeholder = "add a To-do"
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        [addImage,buttonText].forEach{addSubview($0)}
        configureLayout()
    }
    
    func configureLayout(){
        addImage.anchor(top: nil, leading: leadingAnchor, bottom: nil, trailing: buttonText.leadingAnchor, padding: .init(top: 0, left: 15, bottom: 0, right: -20), centerY: centerYAnchor, centerX: nil)
        buttonText.anchor(top: topAnchor, leading: addImage.trailingAnchor , bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), centerY: nil, centerX: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

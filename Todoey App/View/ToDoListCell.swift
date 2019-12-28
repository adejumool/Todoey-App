//
//  ToDoListCell.swift
//  Todoey App
//
//  Created by Tobi Adejumo on 12/27/19.
//  Copyright © 2019 Tobi Adejumo. All rights reserved.
//

import UIKit

class ToDoListCell: UITableViewCell {
    var listLable: UILabel = {
        let view = UILabel()
        
        view.numberOfLines = 0
        view.adjustsFontSizeToFitWidth = true
        return view
    }()
    var listCheckMark: UIImageView = {
        let view = UIImageView()
        view.heightAnchor.constraint(equalToConstant: 30).isActive = true
        view.widthAnchor.constraint(equalToConstant: 30).isActive = true
        return view
    }()
    
    func set (cell: todoListElement){
        listLable.text = cell.note
        if cell.check == false{
            listCheckMark.image = UIImage(named: "unchecked")
        }else if cell.check == true{
            listCheckMark.image = UIImage(named: "checked")
        }
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        [listLable, listCheckMark].forEach{addSubview($0)}
        
        listLable.anchor(top: nil, leading: listCheckMark.trailingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 20, bottom: 0, right: 0), centerY: centerYAnchor, centerX: nil)
        
        listCheckMark.anchor(top: nil, leading: leadingAnchor, bottom: nil, trailing: listLable.leadingAnchor, padding: .init(top: 0, left: 20, bottom: 0, right: -20), centerY: centerYAnchor, centerX: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}

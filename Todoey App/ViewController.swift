//
//  ViewController.swift
//  Todoey App
//
//  Created by Tobi Adejumo on 12/26/19.
//  Copyright © 2019 Tobi Adejumo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let header:UIView = {
        let view = UIView()
        //view.backgroundColor = .cyan
        view.heightAnchor.constraint(equalToConstant: 250).isActive = true
        return view
    }()
    let headerGradient:CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.orange.cgColor, UIColor.cyan.cgColor]
        gradient.locations = [-0.2,1.2]
        return gradient
    }()
    let body: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        [header,body].forEach {view.addSubview($0)}
        
        header.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 0, left: 0, bottom: -10, right: 0))
        body.anchor(top: header.bottomAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor)
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        headerGradient.frame = header.bounds
        [headerGradient].forEach{header.layer.insertSublayer($0, at: 0)}
    }
}

extension UIView{
    func anchor(top:NSLayoutYAxisAnchor?,leading:NSLayoutXAxisAnchor?,bottom: NSLayoutYAxisAnchor?,trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero){
        
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
        
    }
}


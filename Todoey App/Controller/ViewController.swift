    //
    //  ViewController.swift
    //  Todoey App
    //
    //  Created by Tobi Adejumo on 12/26/19.
    //  Copyright © 2019 Tobi Adejumo. All rights reserved.
    //

    import UIKit

    class ViewController: UIViewController {
        let footerElement = NewItemPopUp()
        let notificationCenter = NotificationCenter.default
        
        var allToDoListElements: [TodoListElement] = []
        
        let persistenceManager:PersistenceManager = PersistenceManager.shared

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
        let footer: UIView = {
            let view = UIView()
            view.backgroundColor = .white
            view.heightAnchor.constraint(equalToConstant: 50).isActive = true
            return view
        }()
        let todoList: UITableView = {
            let view = UITableView()

            return view
        }()
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            footerElement.buttonText.delegate = self
            
            [header,body,footer].forEach {view.addSubview($0)}
            configureViews()
            
            notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
            notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillShowNotification, object: nil)
            //Listen For Keyboard
            
        }
        override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            
            configureTableVIew(mainView: body, tableView: todoList)
            configureFooter(footer: footer, footerElements: footerElement)
            
            headerGradient.frame = header.bounds
            [headerGradient].forEach{header.layer.insertSublayer($0, at: 0)}
        }
        
        func addNewElementToList(){
            if let newListItem = footerElement.buttonText.text{
                let newElement = TodoListElement(context: persistenceManager.context)
                newElement.check = false
                newElement.note = newListItem
                inserNewElement(tableView: todoList, newElement: newElement)
                
                persistenceManager.saveContext()
            }
        }
    }


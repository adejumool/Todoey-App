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
    let footer: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }()
    let todoList: UITableView = {
        let view = UITableView()

        return view
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        [header,body,footer].forEach {view.addSubview($0)}
        configureViews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        configureTableVIew(mainView: body, tableView: todoList)
        
        headerGradient.frame = header.bounds
        [headerGradient].forEach{header.layer.insertSublayer($0, at: 0)}
    }
}

extension ViewController{
    func configureViews(){
        header.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 0, left: 0, bottom: -10, right: 0), centerY: nil, centerX: nil)
        body.anchor(top: header.bottomAnchor, leading: view.leadingAnchor, bottom: footer.topAnchor, trailing: view.trailingAnchor, centerY: nil, centerX: nil)
        footer.anchor(top: body.bottomAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor, centerY: nil, centerX: nil)

    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func configureTableVIew(mainView: UIView, tableView: UITableView){
        mainView.addSubview(tableView)
        tableView.frame = mainView.bounds
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 50
        
        tableView.register(ToDoListCell.self, forCellReuseIdentifier: "toDoCell")
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return fetchData().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "toDoCell")as! ToDoListCell
        let cellinfo = fetchData()[indexPath.row]
        cell.set(cell: cellinfo)
        
        return cell
    }
    
    
}

extension ViewController{
    func fetchData() -> [todoListElement]{
        let element1 = todoListElement(check: false ,note: "My first to do list task")
        return [element1]
    }
}


//
//  TableView Extensions.swift
//  Todoey App
//
//  Created by Tobi Adejumo on 12/29/19.
//  Copyright © 2019 Tobi Adejumo. All rights reserved.
//

import UIKit

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
        
        return fetchData()/*allToDoListElements*/.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "toDoCell")as! ToDoListCell
        let cellinfo = fetchData()/*allToDoListElements*/[indexPath.row]
        cell.set(cell: cellinfo)
        
        return cell
    }
    
    func inserNewElement(tableView: UITableView, newElement: TodoListElement){
        
        allToDoListElements.append(newElement)
        let indexPath = IndexPath(row: allToDoListElements.count-1, section: 0)
        
        tableView.beginUpdates()
        tableView.insertRows(at: [indexPath], with: .automatic)
        tableView.endUpdates()
    }
    
}

extension ViewController{
    func fetchData() -> [TodoListElement]{
        let listElement = persistenceManager.fetch(objectType: TodoListElement.self)
        return listElement
    }
    
    func removeData(){
        
    }
}

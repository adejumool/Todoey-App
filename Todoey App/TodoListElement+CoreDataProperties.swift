//
//  TodoListElement+CoreDataProperties.swift
//  Todoey App
//
//  Created by Tobi Adejumo on 12/30/19.
//  Copyright © 2019 Tobi Adejumo. All rights reserved.
//
//

import Foundation
import CoreData


extension TodoListElement {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TodoListElement> {
        return NSFetchRequest<TodoListElement>(entityName: "TodoListElement")
    }

    @NSManaged public var check: Bool
    @NSManaged public var note: String

}

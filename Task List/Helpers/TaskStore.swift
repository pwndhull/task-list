//
//  TaskStore.swift
//  Task List
//
//  Created by Pawan Dhull on 16/05/20.
//  Copyright © 2020 Pawan Dhull. All rights reserved.
//

import Foundation

class TaskStore {
    var tasks = [[Task](),[Task]()]
    
    func add(_ task:Task,at index : Int , isdone: Bool = false) {
        var section = isdone ? 1 : 0
        
        tasks[section].insert(task,at: index)
    }
    @discardableResult func removeTask(at index: Int,isdone:Bool = false) -> Task {
        let section = isdone ? 1 : 0
        return tasks[section].remove(at: index)
    }
}

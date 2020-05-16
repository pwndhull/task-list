//
//  TaskUtilities.swift
//  Task List
//
//  Created by Pawan Dhull on 16/05/20.
//  Copyright © 2020 Pawan Dhull. All rights reserved.
//

import Foundation

class TaskUtility{
    private static let key = "tasks"
    //archive
    private static func archive ( _ task:[[Task]]) -> Data? {
        return try? NSKeyedArchiver.archivedData(withRootObject: task, requiringSecureCoding: false)
    }
    
    //fetch
    static func fetch() -> [[Task]]? {
   guard let unarchivedData = UserDefaults.standard.object(forKey: key) as? Data else { return nil }
        return  try? NSKeyedUnarchiver.unarchiveObject(with: unarchivedData) as? [[Task]] ?? [[]]
    }
    
    //save
    static func save( _ task:[[Task]]){
        let archiveTasks = archive(task)
    
        UserDefaults.standard.setValue(archiveTasks, forKey: key)
        UserDefaults.standard.synchronize()
    }
}

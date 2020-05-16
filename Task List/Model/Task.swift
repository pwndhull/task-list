//
//  Task.swift
//  Task List
//
//  Created by Pawan Dhull on 16/05/20.
//  Copyright © 2020 Pawan Dhull. All rights reserved.
//

import Foundation

class Task : NSObject,NSCoding {
    var Name : String?
    var isDone : Bool?
    
    private let nameKey = "name"
    private let isDoneKey = "isDone"
    
    init(Name: String,isDone:Bool = false) {
        self.Name = Name
        self.isDone = isDone
    }
    func encode(with aCoder: NSCoder){
        
        aCoder.encode(Name, forKey:nameKey)
        aCoder.encode(isDone,forKey:isDoneKey)
        
    }
    required init?(coder aDecoder : NSCoder) {
        guard let Name = aDecoder.decodeObject(forKey:nameKey) as? String,
        let isDone = aDecoder.decodeObject(forKey:isDoneKey) as? Bool else { return }
        self.Name = Name
        self.isDone = isDone
    }
}

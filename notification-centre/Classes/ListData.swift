//
//  Data.swift
//  InfiniteScrollTutorial
//
//  Created by mac on 25/09/2019.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation

struct ListData<T> {
    var value: T
    var id: Int
    
    init(value:T, id:Int){
        self.value = value
        self.id = id
    }
}

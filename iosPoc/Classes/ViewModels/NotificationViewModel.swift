//
//  NotificationViewModel.swift
//
//  Created by Richard Fisk on 29/4/20.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation
import SwiftUI


struct NotificationViewModel {
    let dispatchQueue: DispatchQueue = DispatchQueue.global(qos: .userInitiated)
    
    var node: Notifications.Edge.Node
    var id: String
    var viewed: Bool
    var dateOnScreen:Date?
    var client = GraphQLPocCLient()
}

//
//  NotificationViewModel.swift
//
//  Created by Richard Fisk on 29/4/20.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation
import SwiftUI

typealias AsJob = Notifications.Edge.Node.Item.AsJob

struct JobLocation {
    var flattened: String?
}

struct Advertiser {
    var name: String?
}

struct JobViewModel {
    var url: URL?
    var title: String
    var location: JobLocation?
    var advertiser: Advertiser?
    var brandingLogo: URL?
    
    init?(_ job: AsJob?) {
        if let jobValue = job {
            print(jobValue)
            print("")
            let optionalAction = jobValue.title.actions?.map { $0.asNavigationAction }.compactMap { $0 }.first
            self.url = URL(string: optionalAction?.action ?? "")
            self.title = jobValue.title.text
            self.location = JobLocation(flattened: jobValue.location?.flattened)
            self.advertiser = Advertiser(name: jobValue.advertiser?.name)
            self.brandingLogo = jobValue.branding?.logo
        }
        else {
            return nil
        }
    }
}

struct NotificationViewModel {
    let dispatchQueue: DispatchQueue = DispatchQueue.global(qos: .userInitiated)
    
    var node: Notifications.Edge.Node
    var id: String
    var viewed: Bool
    var dateOnScreen:Date?
    var client = GraphQLPocCLient()
//    var hasSpecificType: Bool {
//        get {
//            return applicationViewedViewModel != nil || asNewViewModel != nil
//        }
//    }
}

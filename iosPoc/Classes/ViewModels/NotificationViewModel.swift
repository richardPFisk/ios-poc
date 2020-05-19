//
//  NotificationViewModel.swift
//
//  Created by Richard Fisk on 29/4/20.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation
import SwiftUI

//typealias AsNew = SeekNotification.Edge.Node.AsNewSavedSearchNotification
//typealias AppViewed = SeekNotification.Edge.Node.AsApplicationViewedNotification
//typealias AppViewedJob = SeekNotification.Edge.Node.AsApplicationViewedNotification.Job;
//typealias AsNewJob = SeekNotification.Edge.Node.AsNewSavedSearchNotification.Job;

struct JobLocation {
    var flattened: String?
}

struct Advertiser {
    var name: String?
}

struct JobViewModel {
    var url: URL
    var title: String
    var location: JobLocation?
    var advertiser: Advertiser?
    var brandingLogo: URL?
    
//    static func convertGraphQL(_ job: AppViewedJob) -> JobViewModel {
//        JobViewModel(url: URL(string: job.url)!, title: job.title, location: JobLocation(flattened: job.location?.flattened), advertiser: Advertiser(name: job.advertiser?.name), brandingLogo: job.brandingLogo)
//    }
//    
//    static func convertGraphQL(_ job: AsNewJob) -> JobViewModel {
//        JobViewModel(url: URL(string: job.url)!, title: job.title, location: JobLocation(flattened: job.location?.flattened), advertiser: Advertiser(name: job.advertiser?.name), brandingLogo: job.brandingLogo)
//    }
}

struct NotificationViewModel {
    let dispatchQueue: DispatchQueue = DispatchQueue.global(qos: .userInitiated)
    
    var node: SeekNotification.Edge.Node
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

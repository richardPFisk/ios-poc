//
//  NotificationViewModel.swift
//
//  Created by Richard Fisk on 29/4/20.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation
import SwiftUI

typealias AsNew = Optional<SeekNotification.Edge.Node.AsNewSavedSearchNotification>
typealias AppViewed = Optional<SeekNotification.Edge.Node.AsApplicationViewedNotification>
typealias AppViewedJob = SeekNotification.Edge.Node.AsApplicationViewedNotification.Job;
typealias AsNewJob = SeekNotification.Edge.Node.AsNewSavedSearchNotification.Job;

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
    
    static func convertGraphQL(_ job: AppViewedJob) -> JobViewModel {
        JobViewModel(url: URL(string: job.url)!, title: job.title, location: JobLocation(flattened: job.location?.flattened), advertiser: Advertiser(name: job.advertiser?.name), brandingLogo: job.brandingLogo)
    }
    
    static func convertGraphQL(_ job: AsNewJob) -> JobViewModel {
        JobViewModel(url: URL(string: job.url)!, title: job.title, location: JobLocation(flattened: job.location?.flattened), advertiser: Advertiser(name: job.advertiser?.name), brandingLogo: job.brandingLogo)
    }
}

class NotificationViewModel: ObservableObject {
    static let viewedColor = Color(red: 225/255.0, green: 225/255.0, blue: 225/255.0)
    static let notViewedColor = Color(red: 253/255.0, green: 253/255.0, blue: 253/255.0)
    
    var id: String

    var applicationViewedViewModel: ApplicationViewedViewModel?
    var asNewViewModel: AsNewViewModel?
    
    init (id: String, viewed: Bool, applicationViewedViewModel: ApplicationViewedViewModel?, asNewViewModel: AsNewViewModel?) {
        self.id = id

        self.applicationViewedViewModel = applicationViewedViewModel
        self.asNewViewModel = asNewViewModel
    }
}

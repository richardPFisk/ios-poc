//
//  NotificationViewModel.swift
//
//  Created by Richard Fisk on 29/4/20.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation

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

struct AsNewViewModel {
    var viewed: Bool?
    var jobs: [JobViewModel]?
    
    static func convertGraphQL(_ asNew: AsNew) -> AsNewViewModel? {
        if let jobs = asNew?.jobs, let viewedValue = asNew?.viewed {
            return AsNewViewModel(viewed: viewedValue, jobs: jobs.map({ JobViewModel.convertGraphQL($0) }))
        }
        return nil
    }
}

struct ApplicationViewedViewModel {
    var viewed: Bool
    var job: JobViewModel
    
    static func convertGraphQL(_ applicationViewed: AppViewed) -> ApplicationViewedViewModel? {
        if let job = applicationViewed?.job, let viewedValue = applicationViewed?.viewed {
            return ApplicationViewedViewModel(viewed: viewedValue, job: JobViewModel.convertGraphQL(job))
        }
        return nil
    }
}

struct NotificationViewModel {
    let dispatchQueue: DispatchQueue = DispatchQueue.global(qos: .userInitiated)
    
    var id: String
    var applicationViewedViewModel: ApplicationViewedViewModel?
    var asNewViewModel: AsNewViewModel?
    var client = GraphQLPocCLient()
    
    func notificationUpdateViewed() {
        client.notificationUpdateViewed(id: self.id, dispatchQueue: dispatchQueue) { notification, _ in
//          DispatchQueue.main.async { [weak self] in
//              guard let self = self else {
//                return
//              }
//              self.asNewViewModel?.viewed = true
//          }
        }
    }
}

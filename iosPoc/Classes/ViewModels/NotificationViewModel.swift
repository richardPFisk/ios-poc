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
    let dispatchQueue: DispatchQueue = DispatchQueue.global(qos: .userInitiated)
    
    var id: String
    @State var viewed: Bool
    @State var dateOnScreen:Date?
    var applicationViewedViewModel: ApplicationViewedViewModel?
    var asNewViewModel: AsNewViewModel?
    var client = GraphQLPocCLient()
    
    init (id: String, viewed: Bool, applicationViewedViewModel: ApplicationViewedViewModel?, asNewViewModel: AsNewViewModel?) {
        self.id = id
        self.viewed = viewed
        self.applicationViewedViewModel = applicationViewedViewModel
        self.asNewViewModel = asNewViewModel
    }
    
    func hasBeenOnScreen(_ dateOnScreen: Date?, maxSeconds: Int = 2) -> Bool {
        if let dateOnScreenValue = dateOnScreen {
            let calendar1 = Calendar.current
            let components = calendar1
                .dateComponents([.year,.month,.day,.hour,.minute,.second,.nanosecond], from: dateOnScreenValue, to: Date())
            if let elapsedSeconds = components.second {
                return elapsedSeconds > maxSeconds
            }
            return false
        }
        return false
    }
    
    // Move into sub-classes
    func updateViewed(_ id: String, _ index: Int) {
        if self.dateOnScreen == nil {
           self.dateOnScreen = Date()
        }
        else if !self.viewed && hasBeenOnScreen(self.dateOnScreen) {
            client.notificationUpdateViewed(id: id, dispatchQueue: dispatchQueue) { (result, error) in
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else {
                      return
                    }
                    if let viewed = result?.node?.viewed {
                        self.viewed = viewed
                    }
                }
            }
        }
    }
}

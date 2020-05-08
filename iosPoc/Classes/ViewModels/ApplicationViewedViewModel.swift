//
//  ApplicationViewedViewModel.swift
//  iosPoc
//
//  Created by Richard Fisk on 7/5/20.
//

import Foundation
import SwiftUI

class ApplicationViewedViewModel : ObservableObject {
    @State var viewed: Bool
    @State var job: JobViewModel
    @State var dateOnScreen:Date?
    var id: String
    let dispatchQueue: DispatchQueue = DispatchQueue.global(qos: .userInitiated)
    var client = GraphQLPocCLient()
    
    init?(_ applicationViewed: AppViewed) {
        if let job = applicationViewed?.job, let viewedValue = applicationViewed?.viewed, let id = applicationViewed?.id {
            self.viewed = viewedValue
            self.job = JobViewModel.convertGraphQL(job)
            self.id = id
        }
        else {
            return nil
        }
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
    func updateViewed() {
        if self.dateOnScreen == nil {
            
           self.dateOnScreen = Date()
            print("\(self.dateOnScreen) wtf?")
        }
        else if !self.viewed && hasBeenOnScreen(self.dateOnScreen) {
            client.notificationUpdateViewed(id: self.id, dispatchQueue: dispatchQueue) { (result, error) in
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

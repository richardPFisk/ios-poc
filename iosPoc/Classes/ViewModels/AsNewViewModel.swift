//
//  AsNewViewModel.swift
//  AWSAppSync
//
//  Created by Richard Fisk on 7/5/20.
//

import Foundation
import SwiftUI

class AsNewViewModel: ObservableObject {
    var id: String
    @State var viewed: Bool
    @State var jobs: [JobViewModel]
    @State var dateOnScreen:Date?
    
    let dispatchQueue: DispatchQueue = DispatchQueue.global(qos: .userInitiated)
    var client = GraphQLPocCLient()
    
    init?(_ asNew: AsNew) {
        if let jobs = asNew?.jobs, let viewedValue = asNew?.viewed, let id = asNew?.id {
            self.id = id
            self.viewed = viewedValue
            self.jobs = jobs.map({ JobViewModel.convertGraphQL($0) })
        }
        else {
            return nil
        }
    }
}

extension AsNewViewModel {
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
        print("self.dateOnScreen \(self.dateOnScreen)")
        if self.dateOnScreen == nil {
           self.dateOnScreen = Date()
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

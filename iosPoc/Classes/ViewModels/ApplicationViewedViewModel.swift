//
//  ApplicationViewedViewModel.swift
//  iosPoc
//
//  Created by Richard Fisk on 7/5/20.
//

import Foundation
import SwiftUI

struct ApplicationViewedViewModel {
    var viewed: Bool
    var job: JobViewModel
    var node: AppViewed
    
    static func convertGraphQL(_ applicationViewed: Optional<AppViewed>) -> ApplicationViewedViewModel? {
        if let job = applicationViewed?.job, let viewedValue = applicationViewed?.viewed, let appViewedValue = applicationViewed {
            return ApplicationViewedViewModel(viewed: viewedValue, job: JobViewModel.convertGraphQL(job), node: appViewedValue)
        }
        return nil
    }
}

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
    
    init?(_ applicationViewed: AppViewed) {
        if let job = applicationViewed?.job, let viewedValue = applicationViewed?.viewed {
            self.viewed = viewedValue
            self.job = JobViewModel.convertGraphQL(job)
        }
        return nil
    }
}

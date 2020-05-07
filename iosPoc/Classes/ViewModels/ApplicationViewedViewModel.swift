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
    
    static func convertGraphQL(_ applicationViewed: AppViewed) -> ApplicationViewedViewModel? {
        if let job = applicationViewed?.job, let viewedValue = applicationViewed?.viewed {
            return ApplicationViewedViewModel(viewed: viewedValue, job: JobViewModel.convertGraphQL(job))
        }
        return nil
    }
}

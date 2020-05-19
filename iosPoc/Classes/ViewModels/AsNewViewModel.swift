//
//  AsNewViewModel.swift
//  AWSAppSync
//
//  Created by Richard Fisk on 7/5/20.
//

import Foundation
import SwiftUI

struct AsNewViewModel {
    var viewed: Bool?
    var jobs: [JobViewModel]?
//    var node: AsNew
    
//    static func convertGraphQL(_ asNew: Optional<AsNew>) -> AsNewViewModel? {
//        if let jobs = asNew?.jobs, let viewedValue = asNew?.viewed, let node = asNew {
//            return AsNewViewModel(viewed: viewedValue, jobs: jobs.map({ JobViewModel.convertGraphQL($0) }), node: node)
//        }
//        return nil
//    }
}

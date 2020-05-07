//
//  AsNewViewModel.swift
//  AWSAppSync
//
//  Created by Richard Fisk on 7/5/20.
//

import Foundation
import SwiftUI

class AsNewViewModel: ObservableObject {
    @State var viewed: Bool?
    @State var jobs: [JobViewModel]?
    
    init?(_ asNew: AsNew) {
        if let jobs = asNew?.jobs, let viewedValue = asNew?.viewed {
            self.viewed = viewedValue
            self.jobs = jobs.map({ JobViewModel.convertGraphQL($0) })
        }
        return nil
    }
}

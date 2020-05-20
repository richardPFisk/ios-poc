//
//  RatingViewModel.swift
//  iosPoc
//
//  Created by Richard Fisk on 20/5/20.
//

import Foundation
import SwiftUI

typealias AsRatingNotificationItem = Notifications.Edge.Node.Item.AsRatingNotificationItem

class RatingViewModel : ObservableObject {
    var title: String
    var averageCompanyRating: Double?
    var companyRecommendedPercentage: Double?
    
    @State var selectedCompanyRating: Int = -1
    var wouldRecommend: Bool?
    
    init?(_ rating: AsRatingNotificationItem?) {
        if let ratingValue = rating {
            self.title = ratingValue.title.text
            self.averageCompanyRating = ratingValue.averageCompanyRating
            self.companyRecommendedPercentage = ratingValue.companyRecommendedPercentage
        }
        else {
            return nil
        }
    }
}

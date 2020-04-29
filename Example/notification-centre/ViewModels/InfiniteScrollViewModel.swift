//
//  InfiniteScrollViewModel2.swift
//  InfiniteScrollTutorial
//
//  Created by Richard Fisk on 23/4/20.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation
import Combine

struct PageInfoViewModel {
    var startCursor: String?
    var hasPrevPage: Bool
    var endCursor: String?
    var hasNextPage: Bool
}

class InfiniteScrollViewModel: ObservableObject {
    @Published var items: [ListData<NotificationViewModel>] = []
    
    @Published var pageInfo: PageInfoViewModel = PageInfoViewModel(startCursor: nil, hasPrevPage: false, endCursor: nil, hasNextPage: true)
    
    func convertGraphQL(node: SeekNotification.Edge.Node?) -> NotificationViewModel? {
        if let nodeValue = node {
            let appViewed = ApplicationViewedViewModel.convertGraphQL(nodeValue.asApplicationViewedNotification)
            let asNew = AsNewViewModel.convertGraphQL(nodeValue.asNewSavedSearchNotification)
            return NotificationViewModel(applicationViewedViewModel: appViewed, asNewViewModel: asNew)
        }
        return nil
    }
    
    func getNewItems(currentListSize: Int) {
        if self.pageInfo.hasNextPage {
            GraphQLPocCLient.getNotifications(first: 10, after: self.pageInfo.endCursor) { (result, error) in
                if case .some(let resultValue) = result {
                    let newItems: [ListData<NotificationViewModel>] = resultValue.edges.enumerated().map { (index, element) in
                        let notificationViewModel = NotificationViewModel(applicationViewedViewModel: ApplicationViewedViewModel.convertGraphQL(element.node?.asApplicationViewedNotification), asNewViewModel: AsNewViewModel.convertGraphQL(element.node?.asNewSavedSearchNotification))
                        return ListData(value: notificationViewModel, id: index + self.items.count)
                    }
                    self.items.append(contentsOf: newItems)
                    
                    self.pageInfo = PageInfoViewModel(startCursor: resultValue.pageInfo.startCursor, hasPrevPage: resultValue.pageInfo.hasPrevPage, endCursor: resultValue.pageInfo.endCursor, hasNextPage: resultValue.pageInfo.hasNextPage)
                }
                if case .some(let errorValue) = error {
                    print("GraphQL error {}", errorValue)
                }
            }
        }
    }
}

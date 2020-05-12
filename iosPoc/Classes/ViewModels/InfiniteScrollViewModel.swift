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
    @Published var isLoading = true
    @Published var pageInfo: PageInfoViewModel = PageInfoViewModel(startCursor: nil, hasPrevPage: false, endCursor: nil, hasNextPage: true)
    
    var client = GraphQLPocCLient()
    
    let dispatchQueue = DispatchQueue(label: "clientRequestQueue", qos: .userInitiated)
    
    func convertGraphQL(node: SeekNotification.Edge.Node?) -> NotificationViewModel? {
        if let nodeValue = node {
            let appViewed = ApplicationViewedViewModel.convertGraphQL(nodeValue.asApplicationViewedNotification)
            let asNew = AsNewViewModel.convertGraphQL(nodeValue.asNewSavedSearchNotification)
            
            return NotificationViewModel(node: nodeValue, id: nodeValue.id, viewed: nodeValue.viewed, applicationViewedViewModel: appViewed, asNewViewModel: asNew)
        }
        return nil
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
    
    func updateViewed(_ id: String, _ index: Int) {
        if self.items[index].value.dateOnScreen == nil {
           self.items[index].value.dateOnScreen = Date()
        }
        else if !self.items[index].value.viewed && hasBeenOnScreen(self.items[index].value.dateOnScreen) {
            client.notificationUpdateViewed(id: id, dispatchQueue: dispatchQueue) { (result, error) in
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else {
                      return
                    }
                    if let viewed = result?.node?.viewed {
                        self.items[index].value.viewed = viewed
                    }
                }
            }
        }
    }
    
    func getNewItems(currentListSize: Int) {
        if self.pageInfo.hasNextPage {
            client.getNotifications(first: 10, after: self.pageInfo.endCursor, dispatchQueue: dispatchQueue) { (result, error) in
                if case .some(let resultValue) = result {
                    let newItems: [ListData<NotificationViewModel>?] = resultValue.edges.enumerated().map { (index, element) in
                        if let node = element.node {
                            let notificationViewModel = NotificationViewModel(node: node, id: node.id, viewed: node.viewed, applicationViewedViewModel: ApplicationViewedViewModel.convertGraphQL(node.asApplicationViewedNotification), asNewViewModel: AsNewViewModel.convertGraphQL(node.asNewSavedSearchNotification))
                            return ListData(value: notificationViewModel, id: index + self.items.count)
                        }
                        return nil
                    }
                    DispatchQueue.main.async { [weak self] in
                        guard let self = self else {
                          return
                        }
                        self.items.append(contentsOf: newItems.compactMap { $0 })
                        self.pageInfo = PageInfoViewModel(startCursor: resultValue.pageInfo.startCursor, hasPrevPage: resultValue.pageInfo.hasPrevPage, endCursor: resultValue.pageInfo.endCursor, hasNextPage: resultValue.pageInfo.hasNextPage)
                        self.isLoading = false
                    }
                }
                if case .some(let errorValue) = error {
                    DispatchQueue.main.async { [weak self] in
                        guard let self = self else {
                          return
                        }
                        print("GraphQL error {}", errorValue)
                        self.isLoading = false
                    }
                }
            }
        }
    }
}

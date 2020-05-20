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
    @Published var items: [Notifications.Edge.Node] = []
    @Published var isLoading: Bool = false
    @Published var pageInfo: PageInfoViewModel = PageInfoViewModel(startCursor: nil, hasPrevPage: false, endCursor: nil, hasNextPage: true)
    
    var client = GraphQLPocCLient()
    
    let dispatchQueue = DispatchQueue(label: "clientRequestQueue", qos: .userInitiated)
    
    func convertGraphQL(node: Notifications.Edge.Node?) -> NotificationViewModel? {
        if let nodeValue = node {
            return NotificationViewModel(node: nodeValue, id: nodeValue.id, viewed: nodeValue.viewed)
        }
        return nil
    }
    
    func updateViewed(_ id: String, _ index: Int) {
        if !self.items[index].viewed {
            client.notificationUpdateViewed(id: id, dispatchQueue: dispatchQueue) { (result, error) in
                if let errorValue = error {
                    print("update error \(errorValue)")
                }
                else {
                    print("something updated \(id) \(index)")
                }
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5) { [weak self] in
                    guard let self = self else {
                      return
                    }
                    if let viewed = result?.node?.viewed {
                        self.items[index].viewed = viewed
                    }
                }
            }
        }
    }
    
    func getNewItems(currentListSize: Int, completionHandler: @escaping () -> Void) {
        let completionHandlerValue = completionHandler
        
        print("getNewItems \(currentListSize) \(self.pageInfo.hasNextPage)")
        if self.pageInfo.hasNextPage && !self.isLoading {
            self.isLoading = true

            
            client.getNotifications(first: 6, after: self.pageInfo.endCursor, dispatchQueue: dispatchQueue) { (result, error) in
                if case .some(let resultValue) = result {
                    let newItems: [Notifications.Edge.Node?] = resultValue.edges.map { $0.node }
                    
                    DispatchQueue.main.async { [weak self] in
                        guard let self = self else {
                          return
                        }
                        self.items.append(contentsOf: newItems.compactMap { $0 })
                        self.pageInfo = PageInfoViewModel(startCursor: resultValue.pageInfo.startCursor, hasPrevPage: resultValue.pageInfo.hasPrevPage, endCursor: resultValue.pageInfo.endCursor, hasNextPage: resultValue.pageInfo.hasNextPage)
                        self.isLoading = false
                        completionHandlerValue()
                    }
                }
                if case .some(let errorValue) = error {
                    DispatchQueue.main.async { [weak self] in
                        guard let self = self else {
                          return
                        }
                        print("GraphQL error {}", errorValue)
                        self.isLoading = false
                        completionHandlerValue()
                    }
                }
            }
        }
    }
}

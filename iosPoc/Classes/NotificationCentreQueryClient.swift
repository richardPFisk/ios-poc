
//  Created by Richard Fisk on 23/4/20.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation
import AWSAppSync

public typealias SeekNotification = NotificationCentreQuery.Data.Notification;
public typealias NotificationResultHandler = (_ result: SeekNotification?, _ error: Error?) -> Void

struct GraphQLPocCLient {
    var graphQLClient: ApolloClient?
    
    init() {
        self.graphQLClient = getClient()
    }
    
    func getClient() -> ApolloClient? {
        guard let url = URL(string: "https://candidate-graphql-api-poc.cloud.seek.com.au/graphql")
        else { return nil }

        let graphQLClient = ApolloClient(url: url)
        return graphQLClient
    }
    
    func getNotifications(first: Int, after: String?, dispatchQueue: DispatchQueue, resultHandler: NotificationResultHandler? = nil) {
        
        let query = NotificationCentreQuery(first: first, after: after)
        graphQLClient?.fetch(query: query, cachePolicy: .fetchIgnoringCacheData, queue: dispatchQueue) { (result, error) in
            if let errorValue = error {
                print("error \(errorValue)")
                
            }
            if let handler = resultHandler {
                handler(result?.data?.notifications, error)
            }
        }
    }
    
    func notificationUpdateViewed(id: String, dispatchQueue: DispatchQueue, resultHandler: NotificationResultHandler? = nil) {
        let mutation = NotificationUpdateViewedMutation(id: id)
        graphQLClient?.perform(mutation: mutation, queue: dispatchQueue, resultHandler: { result, error in
            if let errorValue = error {
                print("error \(errorValue)")
            }
        })
    }
}

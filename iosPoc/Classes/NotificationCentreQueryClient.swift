
//  Created by Richard Fisk on 23/4/20.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation
import AWSAppSync

public typealias SeekNotification = NotificationCentreQuery.Data.Notification;
public typealias NotificationResultHandler = (_ result: SeekNotification?, _ error: Error?) -> Void

struct GraphQLPocCLient {
    static func getClient() -> ApolloClient? {
        guard let url = URL(string: "https://candidate-graphql-api-poc.cloud.seek.com.au/graphql")
        else { return nil }

        let graphQLClient = ApolloClient(url: url)
        return graphQLClient
    }
    
    static func getNotifications(first: Int, after: String?, resultHandler: NotificationResultHandler? = nil) {
        let graphQLClient = getClient()
        let query = NotificationCentreQuery(first: first, after: after)
        graphQLClient?.fetch(query: query, cachePolicy: .fetchIgnoringCacheData, queue: .main) { (result, error) in
            if let errorValue = error {
                print("error {}", errorValue)
                
            }
            if let handler = resultHandler {
                handler(result?.data?.notifications, error)
            }
        }
    }
    
    static func notificationUpdateViewed(id: String) {
        let graphQLClient = getClient()
        let mutation = NotificationUpdateViewedMutation(id: id)
        graphQLClient?.perform(mutation: mutation, queue: DispatchQueue.main, resultHandler: { result, error in
            print("result {} error {}", result ?? "", error ?? "")
        })
    }
}
